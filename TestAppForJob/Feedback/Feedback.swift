import Combine
import Foundation

extension Publisher where Failure == Never {
    func assign<Root: AnyObject>(
        to keyPath: WritableKeyPath<Root, Self.Output>, weakly object: Root) -> AnyCancellable
    { self.sink { [weak object] output in object?[keyPath: keyPath] = output } }
}

struct Feedback<State, Event> { let run: (AnyPublisher<State, Never>) -> AnyPublisher<Event, Never> }

extension Feedback {
    init<Effect: Publisher>(effects: @escaping (State) -> Effect) where Effect.Output == Event, Effect.Failure == Never {
        self.run = { state -> AnyPublisher<Event, Never> in
            state
                .map { effects($0) }
                .switchToLatest()
                .eraseToAnyPublisher()
        }
    }
}

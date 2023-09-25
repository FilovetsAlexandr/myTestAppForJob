import Kingfisher
import UIKit

final class PhotosListTableViewCell: UITableViewCell {
    static let reuseId = String(describing: PhotosListTableViewCell.self)
    
    // MARK: - Views
    
    private lazy var photoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // MARK: - Init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Configure
    
    var model: PhotosListTableCellModel?
    func configure(with model: PhotosListTableCellModel) {
        titleLabel.text = model.title
        titleLabel.font = UIFont(name: "Impact", size: 40)
        titleLabel.textColor = .white
        titleLabel.textAlignment = .left
        
        if let imageUrl = model.imageUrl {
            photoImageView.contentMode = .scaleAspectFill
            photoImageView.clipsToBounds = true
            photoImageView.kf.setImage(with: imageUrl)
        } else {
            photoImageView.image = nil
        }
    }

    // MARK: - Private methods

    private func setupUI() {
        contentView.addSubview(photoImageView)
        backgroundColor = .gray
        
        NSLayoutConstraint.activate([
            photoImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            photoImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            photoImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            photoImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
        
        contentView.addSubview(titleLabel)
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            titleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16)
        ])
    }
}

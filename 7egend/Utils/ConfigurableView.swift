import UIKit

protocol Configurable {
    func setup(with viewModel: Any)
}

protocol ConfigurableView: Configurable where Self: UIView {
    associatedtype ViewModel
    func setup(with viewModel: ViewModel)
}

extension ConfigurableView {
    func setup(with viewModel: Any) {
        if let viewModel = viewModel as? ViewModel {
            setup(with: viewModel)
        }
    }
}

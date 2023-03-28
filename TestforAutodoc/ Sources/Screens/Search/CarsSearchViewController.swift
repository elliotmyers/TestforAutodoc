//
//  CarsViewController.swift
//  TestforAutodoc
//
//  Created by Raiden Yamato on 23.03.2023.
//

import UIKit
import Combine

class CarsSearchViewController: UIViewController {
    
    private var cancellables: [AnyCancellable] = []
    private let viewModel: CarsSearchViewModelType
    private let selection = PassthroughSubject<Int, Never>()
    private let search = PassthroughSubject<String,Never>()
    private let appear = PassthroughSubject<Void, Never>()
    @IBOutlet private var loadingView: UIView!
    @IBOutlet private var tableView: UITableView!
    private lazy var alertViewController = AlertViewController(nibName: nil, bundle: nil)
    private lazy var searchController: UISearchController = {
        let searchController = UISearchController(searchResultsController: nil)
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.tintColor = .label
        searchController.searchBar.delegate = self
        searchController.searchBar.searchTextField.accessibilityIdentifier = AccessibilityIdentifiers.CarsSearch.searchTextFieldId
        return searchController
    }()
    private lazy var dataSource = makeDataSource()
    
    init(viewModel: CarsSearchViewModelType) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        bind(to: viewModel)
    }
    
    
    private func configureUI() {
        definesPresentationContext = true
        title = NSLocalizedString("Cars", comment: "Top Cars")
        view.accessibilityIdentifier = AccessibilityIdentifiers.CarsSearch.rootViewId
        
        tableView.accessibilityIdentifier = AccessibilityIdentifiers.CarsSearch.tableViewId
        tableView.tableFooterView = UIView()
        tableView.registerNib(cellClass: CarTableViewCell.self)
        tableView.dataSource = dataSource
        
        navigationItem.searchController = self.searchController
        searchController.isActive = true
        
        add(alertViewController)
        alertViewController.showStartSearch()
        
    }
    
    private func bind(to viewModel: CarsSearchViewModelType) {
        cancellables.forEach { $0.cancel() }
        cancellables.removeAll()
        let input = CarsSearchViewModelInput(appear: appear.eraseToAnyPublisher(), search: search.eraseToAnyPublisher(), selection: selection.eraseToAnyPublisher())
        
        //TODO: - CONTINUE
        let output = viewModel.transform(input: input)
        
    }
    
    
}



extension CarsSearchViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        search.send(searchText)
    }
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        search.send("")
    }
    
}

fileprivate extension CarsSearchViewController {
    
    enum Section: CaseIterable {
        case cars
    }
    
    func makeDataSource() -> UITableViewDiffableDataSource<Section, CarViewModel> {
        return UITableViewDiffableDataSource(
            tableView: tableView,
            cellProvider: { tableView, IndexPath, carViewModel in
                guard let cell = tableView.dequeueReusableCell(withClass: CarTableViewCell.self) else {
                    assertionFailure("Failed to dequeue \(CarTableViewCell.self)!")
                    return UITableViewCell()
                }
                cell.accessibilityIdentifier =
                "\(AccessibilityIdentifiers.CarsSearch.cellId).\(IndexPath.row)"
                cell.bind(to: carViewModel)
                return cell
            }
        )
    }
    
    
    
    
    
    
}

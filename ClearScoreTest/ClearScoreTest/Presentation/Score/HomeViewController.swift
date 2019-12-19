//
//  HomeViewController.swift
//  ClearScoreTest
//
//  Created by Jordi Milla on 19/12/2019.
//  Copyright © 2019 Jordi Milla Catalan. All rights reserved.
//

import RxSwift

class HomeViewController: UIViewController {

    var router: HomeRouter
    private var viewModel: HomeViewModel
    private var disposableBag = DisposeBag()
    let container = UIView()
    let lblTitle = UILabel()
    let lblScore = UILabel()
    let lblSubtitle = UILabel()
    let circularView = CircularProgressView()
    
    init(router: HomeRouter,
         viewModel: HomeViewModel) {
        self.router = router
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setUpUI()
    }
    
    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setUpViewModel()
        viewModel.getScore()
    }

}

extension HomeViewController {
    
    private func setUpViewModel(){
        viewModel.score.asObservable()
            .bind(onNext: { [weak self] (status) in
                guard let safeStatus = status else{
                    return
                }
                switch safeStatus {
                case .loading:
                    break
                    
                case .success(let score):
                    guard let data: Score = score else { return }
                    self?.configureScore(score: data)
                    break
                case .fail:
                    // TODO error handle
                    break
                }
                
            })
            .disposed(by: disposableBag)
    }
}

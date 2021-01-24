//
//  CustomPageViewController() .swift
//  TravelBlog
//
//  Created by Igoro4ka on 24.01.2021.
//


import SwiftUI

class CustomPageViewController: UIPageViewController {
    
//
//    let firstVC = UIHostingController(rootView: Text("First View Controller"))
//    let secondVC = UIHostingController(rootView: Text("Second View Controller"))
//    let thirdVC = UIHostingController(rootView: Text("Third View Controller"))
    
    
    
    lazy var allControllers: [UIViewController] = []
    
    init(imageNames: [ParisImageModel]) {
        super.init(transitionStyle: .scroll,
                   navigationOrientation: .horizontal,
                   options: nil)
        
       
        
        allControllers = imageNames.map { imageName in
            let hostingContoller = UIHostingController(rootView:
                                                        Image(imageName.image)
                                                        .resizable()
                                                        .scaledToFill()
            )
            
            hostingContoller.view.clipsToBounds = true
            
            return hostingContoller
        }
        
        setViewControllers([allControllers.first!], direction: .forward, animated: true, completion: nil)
        
        self.dataSource = self
        self.delegate = self
        
        UIPageControl.appearance().pageIndicatorTintColor = UIColor.systemGray
        UIPageControl.appearance().currentPageIndicatorTintColor = .blue
    }
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    
    
}
 

//MARK: - UIPageViewControllerDataSource
extension CustomPageViewController: UIPageViewControllerDataSource {
    
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let index = allControllers.firstIndex(of: viewController) else { return nil }
        if index == 0 { return nil }
        
        return allControllers[index - 1]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let index = allControllers.firstIndex(of: viewController) else { return nil }
        if index == allControllers.count - 1 { return nil }
        
        return allControllers[index + 1]
    }
    
}


//MARK: - UIPageViewControllerDelegate

extension CustomPageViewController: UIPageViewControllerDelegate {
    
       
       func presentationCount(for pageViewController: UIPageViewController) -> Int {
           return allControllers.count
       }
       
       func presentationIndex(for pageViewController: UIPageViewController) -> Int {
           0
       }
    
}

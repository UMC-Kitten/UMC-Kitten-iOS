//
//  PageViewControllerDelegate.swift
//  UMC-Kitten-iOS
//
//  Created by DOYEON LEE on 1/30/24.
//

import UIKit

extension MyArticleSettingViewController: UIPageViewControllerDataSource, UIPageViewControllerDelegate  {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let index = pages.firstIndex(of: viewController), index > 0 else {
            return nil
        }
        currentPageIndex = index - 1
        return pages[index - 1]
    }

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let index = pages.firstIndex(of: viewController), index < pages.count - 1 else {
            return nil
        }
        currentPageIndex = index + 1
        return pages[index + 1]
    }
    
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        guard completed, let index = pages.firstIndex(of: pageViewController.viewControllers?.first ?? UIViewController()) else {
            return
        }
        
        pageTapBar.selectTapItem(index)
        
        let newPageIndex = index  // 변경할 페이지의 인덱스
        let direction: UIPageViewController.NavigationDirection = (newPageIndex > currentPageIndex) ? .forward : .reverse
        
        let newViewController = pages[newPageIndex]  // 변경할 페이지의 뷰 컨트롤러
        pageViewController.setViewControllers([newViewController], direction: direction, animated: true, completion: nil)
    }
}

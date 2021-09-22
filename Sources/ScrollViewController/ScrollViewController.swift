//
//  ScrollViewController.swift
//  ScrollViewController
//
//  Created by Frank Courville on 2021-09-22.
//

import Foundation
import UIKit

class StackViewController: UIViewController {
    override func loadView() {
        let view = UIView()

        view.addSubview(scrollView)
        scrollView.addSubview(contentView)

        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
            ])

        let topConstraint = contentView.topAnchor.constraint(equalTo: scrollView.topAnchor)
        let bottomConstraint = contentView.bottomAnchor.constraint(lessThanOrEqualTo: scrollView.bottomAnchor)

        topConstraint.priority = .required
        bottomConstraint.priority = .defaultLow

        NSLayoutConstraint.activate([
            topConstraint,
            bottomConstraint,
            contentView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            ])

        self.view = view
    }

    private(set) public var scrollView: UIScrollView = {
        let view = UIScrollView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .top
        return view
    }()

    private(set) public var contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
}


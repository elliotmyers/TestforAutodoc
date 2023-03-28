//
//  UITableView+Common.swift
//  TestforAutodoc
//
//  Created by Raiden Yamato on 23.03.2023.
//

import UIKit


protocol NibProvidable {
    static var nibName: String { get }
    static var nib: UINib { get }
}

extension NibProvidable {
    static var nibname: String {
        return "\(self)"
    }
    static var nib: UINib {
        return UINib(nibName: self.nibname, bundle: nil)
    }
}



protocol ReusableView {
    static var reuseIdentifier: String { get }
}
extension ReusableView {
    static var reuseIdentifier: String {
        return "\(self)"
    }
}


extension UITableView {
    
    func registerNib<T: UITableViewCell>(cellClass `class`: T.Type) where T: NibProvidable & ReusableView {
        register(`class`.nib, forCellReuseIdentifier: `class`.reuseIdentifier)
    }
    
    func dequeueReusableCell<T: UITableViewCell>(withClass `class`: T.Type) -> T?
    where T: ReusableView {
        return self.dequeueReusableCell(withIdentifier: `class`.reuseIdentifier) as? T
    }
    
    
    
}

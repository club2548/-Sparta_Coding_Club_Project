//
//  TodoListCell.swift
//  MyTodoList
//
//  Created by t2023-m0026 on 12/15/23.
//

import UIKit

// 커스텀셀을 사용하기 위해서 TodoListCell 클래스를 선언
class TodoListCell: UITableViewCell {
    
    // UITableView에서 dequeueReusableCell의 indentifier로 사용하기 위한 구문
    static let reuseIdentifier = String(describing: TodoListCell.self)
    
    // 커스텀셀 구성요소. UILabel, UISwitch 두 가지.
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var completeSwitch: UISwitch!
    @IBAction func valueChanged(_ sender: UISwitch) {
        updateChecked()
    }
    
    // 이 메소드는 커스텀셀에서 todos: [Todo]에 접근해 title과 completeSwitch로 값을 가져오고, UISwitch의 상태에 따라 취소선을 반영하기 위해 사용
    func set(todoTitle: String, valueChanged: Bool) {
        title.text = todoTitle
        completeSwitch.isOn = valueChanged
        updateChecked()
    }
    
    // completeSwitch가 isOn일때 취소선, 아닐 때 취소선 없음. 을 체크하는 메소드
    func updateChecked() {
        let attributedString = NSMutableAttributedString(string: title.text!)
        
        if completeSwitch.isOn {
            attributedString.addAttribute(.strikethroughStyle, value: 2, range: NSMakeRange(0, attributedString.length))
        } else {
            attributedString.addAttribute(.strikethroughStyle, value: 0, range: NSMakeRange(0, attributedString.length))
        }
        title.attributedText = attributedString
    }
    

}

//extension String {
//    func strikeThrough() -> NSAttributedString {
//        let attributeString = NSMutableAttributedString(string: self)
//        attributeString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: NSUnderlineStyle.single.rawValue, range: NSMakeRange(0, attributeString.length))
//        return attributeString
//    }
//}

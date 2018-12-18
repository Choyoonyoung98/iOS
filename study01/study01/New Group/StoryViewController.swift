//
//  StoryViewController.swift
//  study01
//
//  Created by 조윤영 on 18/12/2018.
//  Copyright © 2018 조윤영. All rights reserved.
//

import UIKit

class StoryViewController: UIViewController {


    @IBOutlet weak var editBtn: UIBarButtonItem!
    @IBOutlet weak var tableView: UITableView!
    var storyList: [Story] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        setStoryData()
    }

override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        //didSelectRowAt 함수에서 해당 셀을 선택하고 상세정보 뷰로 전환되었다가 다시 돌아오면
        //그 셀이 선택된 상태로 남아있는 현상을 해결해줍니다.
        //viewWillAppear안에 선언되어 뷰가 다시 나타날 때 아래 코드가 실행이 되고
        //현재 선택된 row의 인덱스를 가져와 그 인덱스에 해당하는 row를 이용해 deselect를 해줍니다.
        if let index = tableView.indexPathForSelectedRow {
            tableView.deselectRow(at: index, animated: true)
    }
    
    }

    @IBAction func editAction(_ sender: Any) {
        //현재 테이블 뷰가 editing mode인지 isEditing 상태를 통하여 확인하고
        //그에 따라서 테이블뷰의 editing mode를 설정합니다.
        if tableView.isEditing{
            editBtn.title = "edit"
            tableView.setEditing(false, animated: true)
        }else{
            editBtn.title = "done"
            tableView.setEditing(true, animated: true)
        }
    }
}


//extension의 경우 클래스 밖에서 선언해준다! 제발~~~
extension StoryViewController: UITableViewDataSource {
    //numberOfRowsInSection은 한 섹션에 해당하는 row의 개수를 설정해줍니다.
    //섹션이 한개라면 섹션 별로 다르게 처리할 필요없이 아래와 같이 바로 모델의 데이터 개수로 설정하면 됩니다.
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return storyList.count
    }
    
    //cellForRowAt은 테이블뷰의 각 row에 cell 객체를 반환합니다.
    //강의자료에서 설명하였듯이 Reusable cell을 이용하여 cell객체를 관리합니다.
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //cell 객체를 선언합니다. reusable identifier를 제대로 설정해주는거 잊지마세요!
        let cell=tableView.dequeueReusableCell(withIdentifier: "StoryCell")as!StoryCell
                //각 row에 해당하는 cell의 데이터를 넣어주기위해 모델에서 music 데이터 하나를 선언합니다.
        let story = storyList[indexPath.row]
        
                //위에서 가져온 데이터를 각 cell에 넣어줍니다.
        cell.profileImg.image =  story.profileImg
        cell.prifileName.text = story.profileName
        cell.storyImg.image = story.storyImg
        cell.storyLabel.text = story.storyText
        
        
        return cell
    }

}

extension StoryViewController: UITableViewDelegate {
    //didSelectRowAt은 셀을 선택했을때 어떤 동작을 할지 설정해 줄 수 있습니다.
    //여기서는 셀을 선택하면 그에 해당하는 스토리 글로 이동이 가능합니다.
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let nextVC = storyboard?.instantiateViewController(withIdentifier: "DetailStory")as! DetailStoryViewController
        let story = storyList[indexPath.row]
        nextVC.showImg = story.profileImg
        nextVC.showName = story.profileName
        nextVC.showText = story.storyText
        nextVC.showStoryImg = story.storyImg
        navigationController?.pushViewController(nextVC, animated: true)
       
    }
    
    //canMoveRowAt은 테이블뷰의 row의 위치를 이동할 수 있는지 없는지 설정합니다.
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    //moveRowAt은 테이블뷰의 row의 위치가 변화하였을 때, 원하는 작업을 해줄 수 있습니다.
    //지금 이 프로젝트에서는 editing mode에서 row를 변화 시킴에 따라 이 함수가 실행됩니다.
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        //테이블뷰 의 row를 변화시키면 그에 따라 대응되는 모델(데이터)도 변화시켜주어야 합니다.
        //sourceIndexPath와 destinationIndexPath를 통해
        //이동을 시작한 index와 새롭게 설정된 index를 가져올 수 있습니다.
        let movingIndex = storyList[sourceIndexPath.row]
        storyList.remove(at: sourceIndexPath.row)
        storyList.insert(movingIndex, at: sourceIndexPath.row)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            storyList.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
}

//임의로 모델에 데이터를 넣어주는 작업입니다.
//실제로는 서버에서 데이터를 받아와 모델에 할당합니다.
extension StoryViewController {
    func setStoryData() {
        let story1 = Story(profile: "profile", name: "조윤영", text: "우리 강아지 귀여움", img: "dog")
        let story2 = Story(profile: "profile", name: "조우석", text: "우리 강아지 귀여움2", img: "dog")
        let story3 = Story(profile: "profile", name: "전미경", text: "우리 강아지 귀여움3", img: "dog")
        let story4 = Story(profile: "profile", name: "조영서", text: "우리 강아지 귀여움4", img: "dog")
        storyList = [story1, story2, story3, story4]
        tableView.reloadData()
    }
}

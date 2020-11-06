//
//  ViewController.swift
//  PA3_iOS
//
//  Created by SHIN YOON AH on 2020/11/06.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var profileCollectionView: UICollectionView!
    @IBOutlet weak var profileButton: UIButton!
    
    
    var profile: [Profile] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setProfileData()
        profileCollectionView.delegate = self
        profileCollectionView.dataSource = self
        setUp()
    }

    func setUp() {
        profileButton.layer.masksToBounds = true
        profileButton.layer.cornerRadius = 12
    }
    
    func setProfileData() {
        profile.append(contentsOf: [
            Profile(imageName: "이주혁", statusMessage: "#hereis#아요#내꿈은#사과농장#ENFP"),
            Profile(imageName: "김나연", statusMessage: "#이제막학기 #여러분들이랑_친해지고_싶어요 #번개스터디환영"),
            Profile(imageName: "손평화", statusMessage: "#핸드피쓰 #이너피쓰 #배꼽도둑 #헬린이 #sson_peace7"),
            Profile(imageName: "유희수", statusMessage: "#총무꿈나무 #유총무 #현재_소식중 #풉"),
            Profile(imageName: "박세은", statusMessage: "#마 #아요는 #처음입니다"),
            Profile(imageName: "한울", statusMessage: "#ENFP #STORM #울크박스 #@hwooolll #하늘콜렉터"),
            Profile(imageName: "김한솔", statusMessage: "#고객중심#고객행동데이터기반한#UX디자이너#워너비,,"),
            Profile(imageName: "배민주", statusMessage: "#디팟장 #개자이너 #최종목표는행복"),
            Profile(imageName: "최영훈", statusMessage: "#서팟짱 #솝트3회차 #앱잼_요리_개발자 #UX/UI"),
            Profile(imageName: "강민구", statusMessage: "#밍맹 #안팟장 #이래뵈도_귀여운거좋아함 #지박령 #허당"),
            Profile(imageName: "이정연", statusMessage: "#플레이스픽 #ENFJ #기획_디자인_개발_다"),
            Profile(imageName: "홍준엽", statusMessage: "#26기서버 #27기웹 #샵이_두개면_어떻게될까? ##")
        ])
    }
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return profile.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = profileCollectionView.dequeueReusableCell(withReuseIdentifier: ProfileViewCell.identifier, for: indexPath) as? ProfileViewCell else {
            return UICollectionViewCell()
        }
        cell.setCell(info: profile[indexPath.item])
        
        return cell
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 150, height: 225)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 27
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 41, left: 20, bottom: 0, right: 20)
    }
}



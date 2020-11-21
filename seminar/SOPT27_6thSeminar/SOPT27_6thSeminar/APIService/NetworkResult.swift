//
//  NetworkResult.swift
//  SOPT27_6thSeminar
//
//  Created by SHIN YOON AH on 2020/11/21.
//

import Foundation

enum NetworkResult<T> {
    case success(T)
    case requestErr(T)
    case pathErr
    case serverErr
    case networkFail
}

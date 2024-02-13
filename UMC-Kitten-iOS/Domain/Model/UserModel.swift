//
//  UserModel.swift
//  UMC-Kitten-iOS
//
//  Created by DOYEON LEE on 2/13/24.
//

import Foundation
//public class UserDetailResponseDto {
//
//    private final Long id;
//    private final String email;
//    private final String nickname;
//    private UserRole userRole;
//    private OAuth2Provider provider;
//    private String providerId;
//    private String profileImage;
//    private Boolean hasPet;
//    private List<Pet> pets;
//}

struct UserModel {
    let nickname: String
    let profileImage: String?
    let hasPet: Bool
    let pets: [PetModel]
}

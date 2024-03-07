## 프로젝트 시작 방법
1. [tuist 설치](https://docs.tuist.io/documentation/tuist/installation/)
2.  터미널에 `tuist fetch` 입력
1. 터미널에 `tuist generate` 입력
3. 생성된 `Kitten.xcworkspace`로 xcode 열기
4. [Tuist > Dependencies > SwiftPakageManager > .build > checkouts ] 폴더 찾기
<img width="261" alt="image" src="https://github.com/UMC-Kitten/UMC-Kitten-iOS/assets/71880682/307e94a8-a1e5-4b81-a9c1-7825ced7befa">

이중 Moya, KakaoSDKUser, KakaoSDKAuth, KakaoSDKCommon 에 대해 Minimum Deployments를 **11.0 > 12.0** 으로 변경

![image](https://github.com/UMC-Kitten/UMC-Kitten-iOS/assets/71880682/a8344625-d2a7-4efb-af61-a744c9afe171)
5. 빌드

## 브랜치
- main: 배포 가능 버전 (현: Tuist 적용 전)
- dev: 개발 버전 (현: Tuist 적용 후)

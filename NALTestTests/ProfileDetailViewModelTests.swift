//
//  ProfileDetailViewModelTests.swift
//  NALTestTests
//
//  Created by Van Le H. on 4/15/20.
//  Copyright © 2020 Van Le H All rights reserved.
//

import Foundation
import OHHTTPStubs
import Quick
import Nimble

@testable import NALTest

final class ProfileDetailViewModelTests: QuickSpec {

    override func spec() {

        var viewModel: ProfileDetailViewModel!

        beforeEach {
            viewModel = ProfileDetailViewModel()
        }

        describe("Test method 'getProfile'") {
            context("When method is called and completed") {
                it("Response should return success") {
                    viewModel.id = 2
                    stub(condition: isHost("api.github.com")) { _ in
                        let path: String! = OHPathForFile("ProfileDetail.json", type(of: self))
                        return fixture(filePath: path, status: 200, headers: nil)
                    }
                    waitUntil(timeout: 20) { done in
                        viewModel.getProfile { result in
                            switch result {
                            case .success:
                                expect(viewModel.user.username) == "hello"
                                expect(viewModel.user.numberOfFollowers) == 4
                                done()
                            case .failure:
                                fail()
                            }
                        }
                    }
                }
            }
        }

        afterEach {
            viewModel = nil
        }
    }
}

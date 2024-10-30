//
//  ViewModel.swift
//  Presentation
//
//  Created by 정명곤 on 10/29/24.
//  Copyright © 2024 CleanArchitecture. All rights reserved.
//

import Foundation
import RxSwift
import Domain


final class ViewModel {
  private let network = Network()
  let disposeBag = DisposeBag()

  struct Input {
    let refresh: Observable<Void>
//    let tapButton: Observable<Void>
  }

  struct Output {
    let movieList: Observable<[Movie]>
  }

  func transform(from input: Input) -> Output {

    let movieList = input.refresh
                .flatMapLatest { [weak self] _ -> Observable<[Movie]> in
                    guard let self = self else { return Observable.just([]) }
                    return self.getMovies()
                }

    return Output(movieList: movieList)
  }


  func getMovies() -> Observable<[Movie]> {
    guard let url = URL(string: "https://yts.mx/api/v2/list_movies.json") else { return Observable.just([]) }
    return network.fetchMovieInfo(url: url).map { data in
      guard let movieData = try? JSONDecoder().decode(MovieDataResponse.self, from: data) else {
                          return []
                      }
                      return movieData.data.movies
    }
    .catchAndReturn([])
  }

}

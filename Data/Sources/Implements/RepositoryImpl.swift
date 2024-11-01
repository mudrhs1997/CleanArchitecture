//
//  RepositoryImpl.swift
//  Data
//
//  Created by 정명곤 on 10/30/24.
//

import UIKit
import Domain
import RxSwift
import RxCocoa

public final class RepositoryImpl: Repository {

  public init() { }

  public func fetchMovieList() -> Observable<[Movie]> {
    guard let url = URL(string: "https://yts.mx/api/v2/list_movies.json") else { return Observable.just([]) }
    return URLRequest.get(url: url).map { (dto: ResponseDTO) in
      let movies = dto.data.movies.map {
        $0.toEntity()
      }
      return movies
    }.asObservable()
  }

  public func loadImage(from url: String) -> Observable<UIImage?> {
    guard let url = URL(string: url) else { return Observable.just(nil) }
    return Observable.create { observer in
      let task = URLSession.shared.dataTask(with: url) { data, response, error in
        if let error {
          observer.onError(error)
        } else if let data = data,
                  let image = UIImage(data: data) {
          observer.onNext(image)
          observer.onCompleted()
        }
      }
      task.resume()
      return Disposables.create {
        task.cancel()
      }
    }
  }
}

extension URLRequest {
  static func get<T: Codable>(url: URL) -> Observable<T> {
    return Observable.just(url)
      .flatMap { url -> Observable<(response: HTTPURLResponse, data: Data)> in
        let request = URLRequest(url: url)
        return URLSession.shared.rx.response(request: request)
      }
      .map { response, data in
        if 200..<300 ~= response.statusCode {
          return try JSONDecoder().decode(T.self, from: data)
        } else {
          throw RxCocoaURLError.httpRequestFailed(response: response, data: data)
        }
      }.asObservable()
  }
}

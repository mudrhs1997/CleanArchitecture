//
//  CartDataSource.swift
//  cubiESIM
//
//  Created by Emily NAN on 5/13/24.
//

import Foundation
//
//struct CartDataSource {
//  private let realm: RealmManager
//  
//  init() {
//    self.realm = RealmManager.shared
//  }
//  
//  //MARK: Save and Update Data to Realm
//  func saveMyCartItemListToRealm(cartResponse: CartListDTO) -> () {
//    if cartResponse.cart_items.count == 0 { return }
//
//    cartResponse.cart_items.forEach { cartItemWithProduct in
//      if let item = cartItemWithProduct {
//        saveCartItemToRealm(cartItem: item)
//
//        if let product = item.esim_product_details {
//          saveProductToRealm(product: product)
//        }
//      }
//    }
//
////    for cartItemWithProduct in cartResponse.cart_items {
////      if let item = cartItemWithProduct {
////        saveCartItemToRealm(cartItem: item)
////        
////        if let product = item.esim_product_details {
////          saveProductToRealm(product: product)
////        }
////    
////      }
////    }
//
//  }
//  
//  func saveCartItemToRealm(cartItem: CartDTO) {
//    realm.write(object: cartItem.toRealm(), writetype: .update)
//  }
//  
//  func saveProductToRealm(product: ProductDTO?) {
//    if let product = product {
//      realm.write(object: product.toRealm(), writetype: .update)
//    }
//  }
//
//  func deleteRealmCartItem(cartitem_id: String) -> () {
//    let itemList = realm.read(object: RealmCartItem.self)
//    
//    let cart_item = itemList.filter({ item in
//      item.cartitem_id == cartitem_id
//    }).first
//    
//    if let cart_item = cart_item {
//      var item = cart_item.toDomain()
//      item.cartitem_status = CartItemStatus.delete.rawValue
//      
//      let realmItem = item.toRealm()
//      realm.write(object: realmItem, writetype: .update)
//      
//    }
//  }
//  
//  //MARK: Set Data from Realm
//  func setCartItemDataFromRealm() -> [CartItemWithProduct]? {
//    var cartItemList = [CartItemWithProduct]()
//    let realmItemList = realm.read(object: RealmCartItem.self)
//    let realmProductList = realm.read(object: RealmProduct.self)
//    //print("product count : \(realmProductList.count)")
//    if realmItemList.count == 0 {
//      return nil
//    }
//
//    for item in Array(realmItemList) {
//      if item.cartitem_status == CartItemStatus.incart.rawValue {
//        var cart_item = item.toWithProductDomain()
//  
//        let realmProduct = realmProductList.filter({
//          $0.esim_product_id == item.esim_product
//        }).first
//        
//        if let realmProduct = realmProduct {
////          print("product: \(realmProduct.esim_product_id)")
//          let product = realmProduct.toDomain()
//          cart_item.esim_product_details = product
//        }
//        
//        cartItemList.append(cart_item)
//      }
//    }
//    return cartItemList
//  }
//  
//}

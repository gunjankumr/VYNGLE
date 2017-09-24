//
//  ProductDetail.swift
//  VYNGLE
//
//  Created by Sujeet on 9/3/17.
//  Copyright © 2017 VYNGLE. All rights reserved.
//

import Foundation
import RealmSwift
import ObjectMapper

class ProductDetailDS: Object, Mappable {
    dynamic var id: Int = 1
    dynamic var os = ""
    dynamic var version = ""
    dynamic var request_time = ""
    dynamic var product_id = ""
    dynamic var server_status = 200
    
    dynamic var product_name: String = ""
    dynamic var category_name: String = ""
    dynamic var item_size: String = ""
    dynamic var botpercase: Int = 1
    dynamic var vintage: Int = 0
    dynamic var country: String = ""
    dynamic var region: String = ""
    dynamic var sub_region: String = ""
    dynamic var appellation: String = ""
    dynamic var estate: String = ""
    dynamic var varietal: String = ""
    dynamic var type: String = ""
    dynamic var critic1_name: String = ""
    dynamic var critic2_name: String = ""
    dynamic var critic3_name: String = ""
    dynamic var critic1_initial: String = ""
    dynamic var critic2_initial: String = ""
    dynamic var critic3_initial: String = ""
    dynamic var critic1_score: Double = 0
    dynamic var critic2_score: Double = 0
    dynamic var critic3_score: Double = 0
    dynamic var critic1_text: String = ""
    dynamic var critic2_text: String = ""
    dynamic var critic3_text: String = ""
    dynamic var food_pairing: String = ""
    dynamic var tasting_notes: String = ""
    dynamic var additional_information: String = ""
    dynamic var producer_notes: String = ""
    dynamic var wine_maker_notes: String = ""
    dynamic var featured: Bool = false
    dynamic var preorder: Bool = false
    dynamic var discount_eligible: Bool = false
    dynamic var promotion_eligible: Bool = false
    dynamic var vendor_id: String = ""
    dynamic var physical_inventory: Int = 0
    dynamic var qty_available: Int = 0
    dynamic var currency: String = ""
    dynamic var actual_cost_per_bottle: Double = 0
    dynamic var import_cost_per_bottle: Double = 0
    dynamic var duty_cost_per_bottle: Double = 0
    dynamic var storage_cost_per_bottle: Double = 0
    dynamic var bottle_price: Double = 0
    dynamic var discount_bottle_price: Double = 0
    dynamic var case_price: Double = 0
    dynamic var discount_case_price: Double = 0
    dynamic var free_shipping: Bool = false
    dynamic var sold_out: Bool = false
    dynamic var current_item: Bool = false  // for new_item
    dynamic var last_bottles: Bool = false
    dynamic var publish_to_live: Bool = false
    dynamic var additional_fees: Double = 0


    var image_list = List<ImageList>()
    
    override static func primaryKey() -> String? {
        return "id"
    }
    
    //Impl. of Mappable protocol
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        os  <- map["request_context.os"]
        version  <- map["request_context.version"]
        request_time  <- map["request_context.request_time"]
        product_id <- map["request_context.product_id"]
        server_status  <- map["request_context.server_status"]
        image_list <- map["image_list"]
        
        product_name <- map["product_detail.product_name"]
        category_name <- map["product_detail.category_name"]
        item_size <- map["product_detail.item_size"]
        botpercase <- map["product_detail.botpercase"]
        vintage <- map["product_detail.vintage"]
        country <- map["product_detail.country"]
        region <- map["product_detail.region"]
        sub_region <- map["product_detail.sub_region"]
        appellation <- map["product_detail.appellation"]
        estate <- map["product_detail.estate"]
        varietal <- map["product_detail.varietal"]
        type <- map["product_detail.type"]
        critic1_name <- map["product_detail.critic1_name"]
        critic2_name <- map["product_detail.critic2_name"]
        critic3_name <- map["product_detail.critic3_name"]
        critic1_initial <- map["product_detail.critic1_initial"]
        critic2_initial <- map["product_detail.critic2_initial"]
        critic3_initial <- map["product_detail.critic3_initial"]
        critic1_score <- map["product_detail.critic1_score"]
        critic2_score <- map["product_detail.critic2_score"]
        critic3_score <- map["product_detail.critic3_score"]
        critic1_text <- map["product_detail.critic1_text"]
        critic2_text <- map["product_detail.critic2_text"]
        critic3_text <- map["product_detail.critic3_text"]
        food_pairing <- map["product_detail.food_pairing"]
        tasting_notes <- map["product_detail.tasting_notes"]
        additional_information <- map["product_detail.additional_information"]
        producer_notes <- map["product_detail.producer_notes"]
        wine_maker_notes <- map["product_detail.wine_maker_notes"]
        featured <- map["product_detail.featured"]
        preorder <- map["product_detail.preorder"]
        discount_eligible <- map["product_detail.discount_eligible"]
        promotion_eligible <- map["product_detail.promotion_eligible"]
        vendor_id <- map["product_detail.vendor_id"]
        physical_inventory <- map["product_detail.physical_inventory"]
        qty_available <- map["product_detail.qty_available"]
        currency <- map["product_detail.currency"]
        actual_cost_per_bottle <- map["product_detail.actual_cost_per_bottle"]
        import_cost_per_bottle <- map["product_detail.import_cost_per_bottle"]
        duty_cost_per_bottle <- map["product_detail.duty_cost_per_bottle"]
        storage_cost_per_bottle <- map["product_detail.storage_cost_per_bottle"]
        bottle_price <- map["product_detail.bottle_price"]
        discount_bottle_price <- map["product_detail.discount_bottle_price"]
        case_price <- map["product_detail.case_price"]
        discount_case_price <- map["product_detail.discount_case_price"]
        free_shipping <- map["product_detail.free_shipping"]
        sold_out <- map["product_detail.sold_out"]
        current_item <- map["product_detail.new_item"]
        last_bottles <- map["product_detail.last_bottles"]
        publish_to_live <- map["product_detail.publish_to_live"]
        additional_fees <- map["product_detail.additional_fees"]

    }
    
    func fetchProductDetailsData() -> ProductDetailDS {
        return ProductDetailsStorage.shared.productDetailsData
    }

}

final class ImageList: Object {
    dynamic var image_id: String = ""
    dynamic var thumbnail_image_path: String = ""
    dynamic var image_path: String = ""
    dynamic var priority: Int = 0
}

extension ImageList: Mappable {
    convenience init?(map: Map) {
        self.init()
    }
    func mapping(map: Map) {
        image_id <- map["image_id"]
        thumbnail_image_path <- map["thumbnail_image_path"]
        image_path <- map["image_path"]
        priority <- map["priority"]
    }
}

/*
final class ProductDetails: Object {
    dynamic var product_id: String = ""
    dynamic var product_name: String = ""
    dynamic var category_name: String = ""
    dynamic var item_size: String = ""
    dynamic var botpercase: Int = 1
    dynamic var vintage: Int = 0
    dynamic var country: String = ""
    dynamic var region: String = ""
    dynamic var sub_region: String = ""
    dynamic var appellation: String = ""
    dynamic var estate: String = ""
    dynamic var varietal: String = ""
    dynamic var type: String = ""
    dynamic var critic1_name: String = ""
    dynamic var critic2_name: String = ""
    dynamic var critic3_name: String = ""
    dynamic var critic1_initial: String = ""
    dynamic var critic2_initial: String = ""
    dynamic var critic3_initial: String = ""
    dynamic var critic1_score: Double = 0
    dynamic var critic2_score: Double = 0
    dynamic var critic3_score: Double = 0
    dynamic var critic1_text: String = ""
    dynamic var critic2_text: String = ""
    dynamic var critic3_text: String = ""
    dynamic var food_pairing: String = ""
    dynamic var tasting_notes: String = ""
    dynamic var additional_information: String = ""
    dynamic var producer_notes: String = ""
    dynamic var wine_maker_notes: String = ""
    dynamic var featured: Bool = false
    dynamic var preorder: Bool = false
    dynamic var discount_eligible: Bool = false
    dynamic var promotion_eligible: Bool = false
    dynamic var vendor_id: String = ""
    dynamic var physical_inventory: Int = 0
    dynamic var qty_available: Int = 0
    dynamic var currency: String = ""
    dynamic var actual_cost_per_bottle: Double = 0
    dynamic var import_cost_per_bottle: Double = 0
    dynamic var duty_cost_per_bottle: Double = 0
    dynamic var storage_cost_per_bottle: Double = 0
    dynamic var bottle_price: Double = 0
    dynamic var discount_bottle_price: Double = 0
    dynamic var case_price: Double = 0
    dynamic var discount_case_price: Double = 0
    dynamic var free_shipping: Bool = false
    dynamic var sold_out: Bool = false
    dynamic var current_item: Bool = false  // for new_item
    dynamic var last_bottles: Bool = false
    dynamic var publish_to_live: Bool = false
    dynamic var additional_fees: Double = 0
}

extension ProductDetails: Mappable {
    convenience init?(map: Map) {
        self.init()
    }
    func mapping(map: Map) {
        product_id <- map["product_id"]
        product_name <- map["product_name"]
        category_name <- map["category_name"]
        item_size <- map["item_size"]
        botpercase <- map["botpercase"]
        vintage <- map["vintage"]
        country <- map["country"]
        region <- map["region"]
        sub_region <- map["sub_region"]
        appellation <- map["appellation"]
        estate <- map["estate"]
        varietal <- map["varietal"]
        type <- map["type"]
        critic1_name <- map["critic1_name"]
        critic2_name <- map["critic2_name"]
        critic3_name <- map["critic3_name"]
        critic1_initial <- map["critic1_initial"]
        critic2_initial <- map["critic2_initial"]
        critic3_initial <- map["critic3_initial"]
        critic1_score <- map["critic1_score"]
        critic2_score <- map["critic2_score"]
        critic3_score <- map["critic3_score"]
        critic1_text <- map["critic1_text"]
        critic2_text <- map["critic2_text"]
        critic3_text <- map["critic3_text"]
        food_pairing <- map["food_pairing"]
        tasting_notes <- map["tasting_notes"]
        additional_information <- map["additional_information"]
        producer_notes <- map["producer_notes"]
        wine_maker_notes <- map["wine_maker_notes"]
        featured <- map["featured"]
        preorder <- map["preorder"]
        discount_eligible <- map["discount_eligible"]
        promotion_eligible <- map["promotion_eligible"]
        vendor_id <- map["vendor_id"]
        physical_inventory <- map["physical_inventory"]
        qty_available <- map["qty_available"]
        currency <- map["currency"]
        actual_cost_per_bottle <- map["actual_cost_per_bottle"]
        import_cost_per_bottle <- map["import_cost_per_bottle"]
        duty_cost_per_bottle <- map["duty_cost_per_bottle"]
        storage_cost_per_bottle <- map["storage_cost_per_bottle"]
        bottle_price <- map["bottle_price"]
        discount_bottle_price <- map["discount_bottle_price"]
        case_price <- map["case_price"]
        discount_case_price <- map["discount_case_price"]
        free_shipping <- map["free_shipping"]
        sold_out <- map["sold_out"]
        current_item <- map["new_item"]
        last_bottles <- map["last_bottles"]
        publish_to_live <- map["publish_to_live"]
        additional_fees <- map["additional_fees"]

    }
}*/

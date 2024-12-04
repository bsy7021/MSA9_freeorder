package com.aloha.freeorder.controller.pos;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.GetMapping;


/**
 * 페이지 컨트롤러
 * 뷰페이지 매핑
 */
@Slf4j
@Controller
@RequestMapping("/pos")
public class PosController {

    @GetMapping("/category")
    public String showCategoryPage() {
        log.info("카테고리 메뉴");
        return "/pos/category";
    }

    @GetMapping("/management")
    public String showManagementPage() {
        log.info("더보기 메뉴");
        return "/pos/management";
    }

    @GetMapping("/payment")
    public String showPaymentPage() {
        log.info("결제내역 메뉴");
        return "/pos/payment";
    }

    @GetMapping("/product")
    public String showProductPage() {
        log.info("상품 메뉴");
        return "/pos/product";
    }
    
    
    
    
    
}

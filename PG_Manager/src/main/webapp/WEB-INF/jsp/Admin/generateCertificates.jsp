<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<jsp:include page="../modules/header.jsp" />


<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Shopping Cart</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f9fa;
            margin: 0;
            padding: 20px;
        }
        .container {
            max-width: 1200px;
            margin: auto;
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
        }
        .cart-item {
            background: #fff;
            padding: 15px;
            border-radius: 10px;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
            width: 30%;
            text-align: center;
            position: relative;
        }
        .cart-item img {
            width: 100px;
            height: 100px;
            object-fit: cover;
        }
        .cart-item h3 {
            font-size: 18px;
            margin: 10px 0;
        }
        .cart-item p {
            color: #555;
            font-size: 14px;
            margin: 5px 0;
        }
        .cart-item .price {
            font-size: 16px;
            font-weight: bold;
            color: #ff5722;
        }
        .cart-item .remove-btn {
            background: #ff4d4d;
            color: white;
            padding: 5px 10px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            position: absolute;
            top: 10px;
            right: 10px;
        }
        .checkout-btn {
            background: #28a745;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            margin-top: 20px;
        }
        .checkout-container {
            text-align: center;
            width: 100%;
        }
    </style>
</head>
<body>





    <h2>🛒 Shopping Cart</h2>

    <div class="container">
        <div class="cart-item">
            <button class="remove-btn">X</button>
            <img src="resources/assets/images/products/p-1.png" alt="HYPERX Headphone">
            <h3>HYPERX Cloud Gaming Headphone</h3>
            <p>Size: S, M</p>
            <p class="price">$99.99</p>
            <p>⭐ 311k Reviews</p>
        </div>

        <div class="cart-item">
            <button class="remove-btn">X</button>
            <img src="resources/assets/images/products/p-2.png" alt="Winter Sweater">
            <h3>Men Winter Knitted Sweater</h3>
            <p>Size: S, M, XL, XXL</p>
            <p class="price">$49.99</p>
            <p>⭐ 12k Reviews</p>
        </div>

        <div class="cart-item">
            <button class="remove-btn">X</button>
            <img src="resources/assets/images/products/p-4.png" alt="Nike Shoes">
            <h3>Jordan Jumpman MVP Men's Shoes</h3>
            <p>Size: US 7, 8, 8.5, 9, 10</p>
            <p class="price">$129.99</p>
            <p>⭐ 200k Reviews</p>
        </div>
    </div>

    <div class="checkout-container">
        <button class="checkout-btn">Proceed to Checkout</button>
    </div>

</body>
</html>

<jsp:include page="../modules/footer.jsp"></jsp:include>

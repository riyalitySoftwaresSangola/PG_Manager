<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">


<!-- Mirrored from coderthemes.com/osen/layouts/index.html by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 13 Mar 2025 05:54:50 GMT -->
<head>
<meta charset="utf-8" />
<title>Admin pannal</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta
	content="A fully featured admin theme which can be used to build CRM, CMS, etc."
	name="description" />
<meta content="Coderthemes" name="author" />

<!-- App favicon -->
<link rel="shortcut icon" href="resources/assets/images/favicon.ico">

<!-- Theme Config Js -->
<script src="resources/assets/js/config.js"></script>

<!-- Vendor css -->
<link href="resources/assets/css/vendor.min.css" rel="stylesheet"
	type="text/css" />

<!-- App css -->
<link href="resources/assets/css/app.min.css" rel="stylesheet"
	type="text/css" id="app-style" />

<!-- Icons css -->
<link href="resources/assets/css/icons.min.css" rel="stylesheet"
	type="text/css" />




</head>

<body>
	<!-- Begin page -->
	<div class="wrapper">






		<!-- Sidenav Menu Start -->
		<div class="sidenav-menu">

			<!-- Brand Logo -->
			<a href="index.html" class="logo"> <span class="logo-light">
					<span class="logo-lg"><img
						src="resources/assets/images/logo.png" alt="logo"></span> <span
					class="logo-sm"><img
						src="resources/assets/images/logo-sm.png" alt="small logo"></span>
			</span> <span class="logo-dark"> <span class="logo-lg"><img
						src="resources/assets/images/logo-dark.png" alt="dark logo"></span>
					<span class="logo-sm"><img
						src="resources/assets/images/logo-sm.png" alt="small logo"></span>
			</span>
			</a>

			<!-- Sidebar Hover Menu Toggle Button -->
			<button class="button-sm-hover">
				<i class="ti ti-circle align-middle"></i>
			</button>

			<!-- Full Sidebar Menu Close Button -->
			<button class="button-close-fullsidebar">
				<i class="ti ti-x align-middle"></i>
			</button>

			<div data-simplebar>

				<!--- Sidenav Menu -->
				<ul class="side-nav">

					<li class="side-nav-title"><a href="#" class="side-nav-link">
							<span class="menu-icon"><i class="ti ti-layout-dashboard"></i></span>
							<span class="menu-text">Dash</span>
					</a></li>

					<li class="side-nav-title">Admin Panel</li>

					<!-- Tenant Management -->
					<li class="side-nav-item"><a data-bs-toggle="collapse"
						href="#tenantManagement" role="button" aria-expanded="false"
						aria-controls="tenantManagement" class="side-nav-link"> <span
							class="menu-icon"><i class="ti ti-users"></i></span> <span
							class="menu-text ">Tenant Management</span> <span
							class="menu-arrow"></span>
					</a>
						<div class="collapse" id="tenantManagement">
							<ul class="sub-menu">
								<li><a href="${pageContext.request.contextPath}/tenantRegister" class="side-nav-link">
										<span class="menu-icon ps-4"><i class="ti ti-user-plus"></i></span>
										<span class="menu-text">Add Tenant</span>
								</a></li>
								<!-- <li><a href="UpdateTenant" class="side-nav-link"> <span
										class="menu-icon  ps-4"><i class="ti ti-pencil"></i></span> <span
										class="menu-text">Update Tenant</span>
								</a></li> -->
								<!-- <li><a href="deleteTenant" class="side-nav-link"> <span
										class="menu-icon ps-4"><i class="ti ti-trash"></i></span> <span
										class="menu-text">Delete Tenant</span>
								</a></li> -->
								<li><a href="${pageContext.request.contextPath}/allTenants" class="side-nav-link"> <span
										class="menu-icon ps-4"><i class="ti ti-list"></i></span> <span
										class="menu-text">View All Tenants</span>
								</a></li>
							</ul>
						</div></li>

					<!-- Room Management -->
					<li class="side-nav-item"><a data-bs-toggle="collapse"
						href="#roomManagement" role="button" aria-expanded="false"
						aria-controls="roomManagement" class="side-nav-link"> <span
							class="menu-icon"><i class="ti ti-home"></i></span> <span
							class="menu-text">Room & Bed Management</span> <span class="menu-arrow"></span>
					</a>
						<div class="collapse" id="roomManagement">
							<ul class="sub-menu">
								<li><a href="${pageContext.request.contextPath}/roomManagementForm" class="side-nav-link">
										<span class="menu-icon ps-4"><i class="ti ti-plus"></i></span> <span
										class="menu-text">Add Room</span>
								</a></li>
								<li><a href="${pageContext.request.contextPath}/bedAssigned" class="side-nav-link"> <span
										class="menu-icon ps-4"><i class="ti ti-bed"></i></span> <span
										class="menu-text">Assign Bed</span>
								</a></li>
						
								<li><a href="${pageContext.request.contextPath}/allRooms" class="side-nav-link"> <span
										class="menu-icon ps-4"><i class="ti ti-list"></i></span> <span
										class="menu-text">View All Rooms</span>
								</a></li>
							</ul>
						</div></li>

					<!-- Bed Management -->
					<%-- <li class="side-nav-item"><a data-bs-toggle="collapse"
						href="#bedManagement" role="button" aria-expanded="false"
						aria-controls="bedManagement" class="side-nav-link"> <span
							class="menu-icon"><i class="ti ti-bed"></i></span> <span
							class="menu-text">Bed Management</span> <span class="menu-arrow"></span>
					</a>
						<div class="collapse" id="bedManagement">
							<ul class="sub-menu">
								<li><a href="${pageContext.request.contextPath}/bedAssigned" class="side-nav-link"> <span
										class="menu-icon ps-4"><i class="ti ti-user-check"></i></span> <span
										class="menu-text">Assign Bed</span>
								</a></li>
								<li><a href="updateBed" class="side-nav-link"> <span
										class="menu-icon ps-4"><i class="ti ti-pencil"></i></span> <span
										class="menu-text">Update Bed</span>
								</a></li>
								<li><a href="deleteBed" class="side-nav-link"> <span
										class="menu-icon ps-4"><i class="ti ti-trash"></i></span> <span
										class="menu-text">Delete Bed</span>
								</a></li>
								<li><a href="${pageContext.request.contextPath}/allBeds" class="side-nav-link"> <span
										class="menu-icon ps-4"><i class="ti ti-list"></i></span> <span
										class="menu-text">View All Beds</span>
								</a></li>
							</ul>
						</div></li>
 --%>
					<!-- Meal Management -->
					<li class="side-nav-item"><a data-bs-toggle="collapse"
						href="#mealManagement" role="button" aria-expanded="false"
						aria-controls="mealManagement" class="side-nav-link"> <span
							class="menu-icon"><i class="ti ti-clipboard-text"></i></span> <span
							class="menu-text">Meal Management</span> <span class="menu-arrow"></span>
					</a>
						<div class="collapse" id="mealManagement">
							<ul class="sub-menu">
								<li><a href="${pageContext.request.contextPath}/addMeal" class="side-nav-link"> <span
										class="menu-icon ps-4"><i class="ti ti-pencil"></i></span> <span
										class="menu-text">Meal Entry</span>
								</a></li>
								<li><a href="${pageContext.request.contextPath}/updateMeal" class="side-nav-link"> <span
										class="menu-icon ps-4"><i class="ti ti-edit"></i></span> <span
										class="menu-text">Update Meal</span>
								</a></li>
								<li><a href="${pageContext.request.contextPath}/viewMeals" class="side-nav-link"> <span
										class="menu-icon ps-4"><i class="ti ti-list"></i></span> <span
										class="menu-text">View Meals</span>
								</a></li>
							</ul>
						</div></li>

					<!-- Billing & Payment -->
					<li class="side-nav-item"><a data-bs-toggle="collapse"
						href="#billingPayment" role="button" aria-expanded="false"
						aria-controls="billingPayment" class="side-nav-link"> <span
							class="menu-icon"><i class="ti ti-currency-rupee"></i></span> <span
							class="menu-text">Billing & Payment</span> <span
							class="menu-arrow"></span>
					</a>
						<div class="collapse" id="billingPayment">
							<ul class="sub-menu">
								<li><a href="${pageContext.request.contextPath}/billingForm" class="side-nav-link"> <span
										class="menu-icon ps-4"><i class="ti ti-file-invoice"></i></span> <span
										class="menu-text">Generate Bill</span>
								</a></li>
								<li><a href="${pageContext.request.contextPath}/paymentEntry" class="side-nav-link"> <span
										class="menu-icon ps-4"><i class="ti ti-credit-card"></i></span> <span
										class="menu-text">Payment Entry</span>
								</a></li>
								<li><a href="${pageContext.request.contextPath}/billingHistory" class="side-nav-link"> <span
										class="menu-icon ps-4"><i class="ti ti-history"></i></span> <span
										class="menu-text">Billing History</span>
								</a></li>
							</ul>
						</div></li>

					<!-- Complaint & Leave -->
					<li class="side-nav-item"><a data-bs-toggle="collapse"
						href="#complaintLeave" role="button" aria-expanded="false"
						aria-controls="complaintLeave" class="side-nav-link"> <span
							class="menu-icon"><i class="ti ti-alert-circle"></i></span> <span
							class="menu-text">Complaint & Leave</span> <span
							class="menu-arrow"></span>
					</a>
						<div class="collapse" id="complaintLeave">
							<ul class="sub-menu">
								<li><a href="${pageContext.request.contextPath}/complaintsForm" class="side-nav-link"> <span
										class="menu-icon ps-4"><i class="ti ti-message-report"></i></span>
										<span class="menu-text">Complaint Submission</span>
								</a></li>
								
								<li><a href="${pageContext.request.contextPath}/viewComplentList" class="side-nav-link"> <span
										class="menu-icon ps-4"><i class="ti ti-list"></i></span> <span
										class="menu-text">View Complaints</span>
								</a></li>
								
								
								<li><a href="${pageContext.request.contextPath}/leave" class="side-nav-link"> <span
										class="menu-icon ps-4"><i class="ti ti-calendar"></i></span> <span
										class="menu-text">Leave Request</span>
								</a></li>
							</ul>
						</div></li>

					<!-- Logout -->
					<li class="side-nav-item"><a href="${pageContext.request.contextPath}/logout"
						class="side-nav-link"> <span class="menu-icon"><i
								class="ti ti-logout"></i></span> <span class="menu-text">Logout</span>
					</a></li>

				</ul>


				<!-- Help Box -->
				<div class="help-box text-center">
					<img src="assets/images/coffee-cup.svg" height="90"
						alt="Helper Icon Image" />
					<h5 class="mt-3 fw-semibold fs-16">Unlimited Access</h5>
					<p class="mb-3 text-muted">Upgrade to plan to get access to
						unlimited reports</p>
					<a href="javascript: void(0);" class="btn btn-danger btn-sm">Upgrade</a>
				</div>

				<div class="clearfix"></div>
			</div>
		</div>
		<!-- Sidenav Menu End -->


		<!-- Topbar Start -->
		<header class="app-topbar">
			<div class="page-container topbar-menu">
				<div class="d-flex align-items-center gap-2">

					<!-- Brand Logo -->
					<a href="index.html" class="logo"> <span class="logo-light">
							<span class="logo-lg"><img
								src="resources/assets/images/logo.png" alt="logo"></span> <span
							class="logo-sm"><img
								src="resources/assets/images/logo-sm.png" alt="small logo"></span>
					</span> <span class="logo-dark"> <span class="logo-lg"><img
								src="resources/assets/images/logo-dark.png" alt="dark logo"></span>
							<span class="logo-sm"><img
								src="resources/assets/images/logo-sm.png" alt="small logo"></span>
					</span>
					</a>

					<!-- Sidebar Menu Toggle Button -->
					<button class="sidenav-toggle-button px-2">
						<i class="ti ti-menu-deep fs-24"></i>
					</button>

					<!-- Horizontal Menu Toggle Button -->
					<button class="topnav-toggle-button px-2" data-bs-toggle="collapse"
						data-bs-target="#topnav-menu-content">
						<i class="ti ti-menu-deep fs-22"></i>
					</button>

					<!-- Button Trigger Search Modal -->
					<div
						class="topbar-search text-muted d-none d-xl-flex gap-2 align-items-center"
						data-bs-toggle="modal" data-bs-target="#searchModal" type="button">
						<i class="ti ti-search fs-18"></i> <span class="me-2">Search
							something..</span> <span class="ms-auto fw-medium">âK</span>
					</div>

					<!-- Mega Menu Dropdown -->
					<div class="topbar-item d-none d-md-flex">
						<div class="dropdown">
							<a href="#"
								class="topbar-link btn btn-link px-2 dropdown-toggle drop-arrow-none fw-medium"
								data-bs-toggle="dropdown" data-bs-trigger="hover"
								data-bs-offset="0,17" aria-haspopup="false"
								aria-expanded="false"> Pages <i
								class="ti ti-chevron-down ms-1"></i>
							</a>

							<div class="dropdown-menu dropdown-menu-xxl p-0">
								<div class="row g-0">
									<div class="col-md-4">
										<div class="p-3">
											<h5 class="mb-2 fw-semibold">UI Components</h5>
											<ul class="list-unstyled megamenu-list">
												<li><a href="#!">Widgets</a></li>
												<li><a href="extended-dragula.html">Dragula</a></li>
												<li><a href="ui-dropdowns.html">Dropdowns</a></li>
												<li><a href="extended-ratings.html">Ratings</a></li>
												<li><a href="extended-sweetalerts.html">Sweet
														Alerts</a></li>
												<li><a href="extended-scrollbar.html">Scrollbar</a></li>
												<li><a href="form-range-slider.html">Range Slider</a></li>
											</ul>
										</div>
									</div>

									<div class="col-md-4">
										<div class="p-3">
											<h5 class="mb-2 fw-semibold">Applications</h5>
											<ul class="list-unstyled megamenu-list">
												<li><a href="apps-ecommerce-products.html">eCommerce
														Pages</a></li>
												<li><a href="apps-hospital-doctors.html">Hospital</a></li>
												<li><a href="apps-email.html">Email</a></li>
												<li><a href="apps-calendar.html">Calendar</a></li>
												<li><a href="apps-kanban.html">Kanban Board</a></li>
												<li><a href="apps-invoices.html">Invoice Management</a>
												</li>
												<li><a href="pages-pricing.html">Pricing</a></li>
											</ul>
										</div>
									</div>

									<div class="col-md-4 bg-light bg-opacity-50">
										<div class="p-3">
											<h5 class="mb-2 fw-semibold">Extra Pages</h5>
											<ul class="list-unstyled megamenu-list">
												<li><a href="javascript:void(0);">Left Sidebar with
														User</a></li>
												<li><a href="javascript:void(0);">Menu Collapsed</a></li>
												<li><a href="javascript:void(0);">Small Left
														Sidebar</a></li>
												<li><a href="javascript:void(0);">New Header Style</a>
												</li>
												<li><a href="javascript:void(0);">My Account</a></li>
												<li><a href="pages-coming-soon.html">Maintenance &
														Coming Soon</a></li>
											</ul>
										</div>
										<!-- end .bg-light-->
									</div>
									<!-- end col-->
								</div>
								<!-- end row-->
							</div>
							<!-- .dropdown-menu-->
						</div>
						<!-- .dropdown-->
					</div>
					<!-- end topbar-item -->
				</div>

				<div class="d-flex align-items-center gap-2">

					<!-- Search for small devices -->
					<div class="topbar-item d-flex d-xl-none">
						<button class="topbar-link" data-bs-toggle="modal"
							data-bs-target="#searchModal" type="button">
							<i class="ti ti-search fs-22"></i>
						</button>
					</div>

					<!-- Language Dropdown -->
					<div class="topbar-item">
						<div class="dropdown">
							<button class="topbar-link" data-bs-toggle="dropdown"
								data-bs-offset="0,25" type="button" aria-haspopup="false"
								aria-expanded="false">
								<img src="resources/assets/images/flags/us.svg" alt="user-image"
									class="w-100 rounded" height="18" id="selected-language-image">
							</button>

							<div class="dropdown-menu dropdown-menu-end">
								<!-- item-->
								<a href="javascript:void(0);" class="dropdown-item"
									data-translator-lang="en"> <img
									src="resources/assets/images/flags/us.svg" alt="user-image"
									class="me-1 rounded" height="18" data-translator-image> <span
									class="align-middle">English</span>
								</a>

								<!-- item-->
								<a href="javascript:void(0);" class="dropdown-item"
									data-translator-lang="hi"> <img
									src="resources/assets/images/flags/in.svg" alt="user-image"
									class="me-1 rounded" height="18" data-translator-image> <span
									class="align-middle">Hindi</span>
								</a>

								<!-- item-->
								<a href="javascript:void(0);" class="dropdown-item"> <img
									src="resources/assets/images/flags/de.svg" alt="user-image"
									class="me-1 rounded" height="18"> <span
									class="align-middle">German</span>
								</a>

								<!-- item-->
								<a href="javascript:void(0);" class="dropdown-item"> <img
									src="resources/assets/images/flags/it.svg" alt="user-image"
									class="me-1 rounded" height="18"> <span
									class="align-middle">Italian</span>
								</a>
  
								<!-- item-->
								<a href="javascript:void(0);" class="dropdown-item"> <img
									src="resources/assets/images/flags/es.svg" alt="user-image"
									class="me-1 rounded" height="18"> <span
									class="align-middle">Spanish</span>
								</a>

								<!-- item-->
								<a href="javascript:void(0);" class="dropdown-item"> <img
									src="resources/assets/images/flags/ru.svg" alt="user-image"
									class="me-1 rounded" height="18"> <span
									class="align-middle">Russian</span>
								</a>

							</div>
						</div>
					</div>

					<!-- Notification Dropdown -->
					<div class="topbar-item">
						<div class="dropdown">
							<button class="topbar-link dropdown-toggle drop-arrow-none"
								data-bs-toggle="dropdown" data-bs-offset="0,25" type="button"
								data-bs-auto-close="outside" aria-haspopup="false"
								aria-expanded="false">
								<i class="ti ti-bell animate-ring fs-22"></i> <span
									class="noti-icon-badge"></span>
							</button>

							<div class="dropdown-menu p-0 dropdown-menu-end dropdown-menu-lg"
								style="min-height: 300px;">
								<div class="p-3 border-bottom border-dashed">
									<div class="row align-items-center">
										<div class="col">
											<h6 class="m-0 fs-16 fw-semibold">Notifications</h6>
										</div>
										<div class="col-auto">
											<div class="dropdown">
												<a href="#"
													class="dropdown-toggle drop-arrow-none link-dark"
													data-bs-toggle="dropdown" data-bs-offset="0,15"
													aria-expanded="false"> <i
													class="ti ti-settings fs-22 align-middle"></i>
												</a>
												<div class="dropdown-menu dropdown-menu-end">
													<!-- item-->
													<a href="javascript:void(0);" class="dropdown-item">Mark
														as Read</a>
													<!-- item-->
													<a href="javascript:void(0);" class="dropdown-item">Delete
														All</a>
													<!-- item-->
													<a href="javascript:void(0);" class="dropdown-item">Do
														not Disturb</a>
													<!-- item-->
													<a href="javascript:void(0);" class="dropdown-item">Other
														Settings</a>
												</div>
											</div>
										</div>
									</div>
								</div>

								<div class="position-relative z-2 card shadow-none rounded-0"
									style="max-height: 300px;" data-simplebar>
									<!-- item-->
									<div
										class="dropdown-item notification-item py-2 text-wrap active"
										id="notification-1">
										<span class="d-flex align-items-center"> <span
											class="me-3 position-relative flex-shrink-0"> <img
												src="resources/assets/images/users/avatar-2.jpg"
												class="avatar-md rounded-circle" alt="" /> <span
												class="position-absolute rounded-pill bg-danger notification-badge">
													<i class="ti ti-message-circle"></i> <span
													class="visually-hidden">unread messages</span>
											</span>
										</span> <span class="flex-grow-1 text-muted"> <span
												class="fw-medium text-body">Glady Haid</span> commented on <span
												class="fw-medium text-body">paces admin status</span> <br />
												<span class="fs-12">25m ago</span>
										</span> <span class="notification-item-close">
												<button type="button"
													class="btn btn-ghost-danger rounded-circle btn-sm btn-icon"
													data-dismissible="#notification-1">
													<i class="ti ti-x fs-16"></i>
												</button>
										</span>
										</span>
									</div>

									<!-- item-->
									<div class="dropdown-item notification-item py-2 text-wrap"
										id="notification-2">
										<span class="d-flex align-items-center"> <span
											class="me-3 position-relative flex-shrink-0"> <img
												src="resources/assets/images/users/avatar-4.jpg"
												class="avatar-md rounded-circle" alt="" /> <span
												class="position-absolute rounded-pill bg-info notification-badge">
													<i class="ti ti-currency-dollar"></i> <span
													class="visually-hidden">unread messages</span>
											</span>
										</span> <span class="flex-grow-1 text-muted"> <span
												class="fw-medium text-body">Tommy Berry</span> donated <span
												class="text-success">$100.00</span> for <span
												class="fw-medium text-body">Carbon removal program</span> <br />
												<span class="fs-12">58m ago</span>
										</span> <span class="notification-item-close">
												<button type="button"
													class="btn btn-ghost-danger rounded-circle btn-sm btn-icon"
													data-dismissible="#notification-2">
													<i class="ti ti-x fs-16"></i>
												</button>
										</span>
										</span>
									</div>

									<!-- item-->
									<div class="dropdown-item notification-item py-2 text-wrap"
										id="notification-3">
										<span class="d-flex align-items-center">
											<div class="avatar-md flex-shrink-0 me-3">
												<span
													class="avatar-title bg-success-subtle text-success rounded-circle fs-22">
													<iconify-icon icon="solar:wallet-money-bold-duotone"></iconify-icon>
												</span>
											</div> <span class="flex-grow-1 text-muted"> You withdraw a
												<span class="fw-medium text-body">$500</span> by <span
												class="fw-medium text-body">New York ATM</span> <br /> <span
												class="fs-12">2h ago</span>
										</span> <span class="notification-item-close">
												<button type="button"
													class="btn btn-ghost-danger rounded-circle btn-sm btn-icon"
													data-dismissible="#notification-3">
													<i class="ti ti-x fs-16"></i>
												</button>
										</span>
										</span>
									</div>

									<!-- item-->
									<div class="dropdown-item notification-item py-2 text-wrap"
										id="notification-4">
										<span class="d-flex align-items-center"> <span
											class="me-3 position-relative flex-shrink-0"> <img
												src="resources/assets/images/users/avatar-7.jpg"
												class="avatar-md rounded-circle" alt="" /> <span
												class="position-absolute rounded-pill bg-secondary notification-badge">
													<i class="ti ti-plus"></i> <span class="visually-hidden">unread
														messages</span>
											</span>
										</span> <span class="flex-grow-1 text-muted"> <span
												class="fw-medium text-body">Richard Allen</span> followed
												you in <span class="fw-medium text-body">Facebook</span> <br />
												<span class="fs-12">3h ago</span>
										</span> <span class="notification-item-close">
												<button type="button"
													class="btn btn-ghost-danger rounded-circle btn-sm btn-icon"
													data-dismissible="#notification-4">
													<i class="ti ti-x fs-16"></i>
												</button>
										</span>
										</span>
									</div>

									<!-- item-->
									<div class="dropdown-item notification-item py-2 text-wrap"
										id="notification-5">
										<span class="d-flex align-items-center"> <span
											class="me-3 position-relative flex-shrink-0"> <img
												src="resources/assets/images/users/avatar-10.jpg"
												class="avatar-md rounded-circle" alt="" /> <span
												class="position-absolute rounded-pill bg-danger notification-badge">
													<i class="ti ti-heart-filled"></i> <span
													class="visually-hidden">unread messages</span>
											</span>
										</span> <span class="flex-grow-1 text-muted"> <span
												class="fw-medium text-body">Victor Collier</span> liked you
												recent photo in <span class="fw-medium text-body">Instagram</span>
												<br /> <span class="fs-12">10h ago</span>
										</span> <span class="notification-item-close">
												<button type="button"
													class="btn btn-ghost-danger rounded-circle btn-sm btn-icon"
													data-dismissible="#notification-5">
													<i class="ti ti-x fs-16"></i>
												</button>
										</span>
										</span>
									</div>
								</div>

								<div style="height: 300px;"
									class="d-flex align-items-center justify-content-center text-center position-absolute top-0 bottom-0 start-0 end-0 z-1">
									<div>
										<iconify-icon icon="line-md:bell-twotone-alert-loop"
											class="fs-80 text-secondary mt-2"></iconify-icon>
										<h4 class="fw-semibold mb-0 fst-italic lh-base mt-3">
											Hey! ð <br />You have no any notifications
										</h4>
									</div>
								</div>

								<!-- All-->
								<a href="javascript:void(0);"
									class="dropdown-item notification-item position-fixed z-2 bottom-0 text-center text-reset text-decoration-underline link-offset-2 fw-bold notify-item border-top border-light py-2">
									View All </a>
							</div>
						</div>
					</div>

					<!-- Apps Dropdown -->
					<div class="topbar-item d-none d-sm-flex">
						<div class="dropdown">
							<button class="topbar-link dropdown-toggle drop-arrow-none"
								data-bs-toggle="dropdown" data-bs-offset="0,25" type="button"
								aria-haspopup="false" aria-expanded="false">
								<i class="ti ti-apps fs-22"></i>
							</button>
							<div class="dropdown-menu dropdown-menu-end dropdown-menu-lg p-0">
								<div class="p-2">
									<div class="row g-0">
										<div class="col">
											<a class="dropdown-icon-item" href="#"> <img
												src="resources/assets/images/brands/slack.svg" alt="slack">
												<span>Slack</span>
											</a>
										</div>
										<div class="col">
											<a class="dropdown-icon-item" href="#"> <img
												src="resources/assets/images/brands/gitlab.svg" alt="Github">
												<span>Gitlab</span>
											</a>
										</div>
										<div class="col">
											<a class="dropdown-icon-item" href="#"> <img
												src="resources/assets/images/brands/dribbble.svg"
												alt="dribbble"> <span>Dribbble</span>
											</a>
										</div>
									</div>

									<div class="row g-0">
										<div class="col">
											<a class="dropdown-icon-item" href="#"> <img
												src="resources/assets/images/brands/bitbucket.svg"
												alt="bitbucket"> <span>Bitbucket</span>
											</a>
										</div>
										<div class="col">
											<a class="dropdown-icon-item" href="#"> <img
												src="resources/assets/images/brands/dropbox.svg"
												alt="dropbox"> <span>Dropbox</span>
											</a>
										</div>
										<div class="col">
											<a class="dropdown-icon-item" href="#"> <img
												src="resources/assets/images/brands/google-cloud.svg"
												alt="G Suite"> <span>G Cloud</span>
											</a>
										</div>
									</div>
									<!-- end row-->

									<div class="row g-0">
										<div class="col">
											<a class="dropdown-icon-item" href="#"> <img
												src="resources/assets/images/brands/aws.svg" alt="bitbucket">
												<span>AWS</span>
											</a>
										</div>
										<div class="col">
											<a class="dropdown-icon-item" href="#"> <img
												src="resources/assets/images/brands/digital-ocean.svg"
												alt="dropbox"> <span>Server</span>
											</a>
										</div>
										<div class="col">
											<a class="dropdown-icon-item" href="#"> <img
												src="resources/assets/images/brands/bootstrap.svg"
												alt="G Suite"> <span>Bootstrap</span>
											</a>
										</div>
									</div>
									<!-- end row-->
								</div>
							</div>
						</div>
					</div>

					<!-- Button Trigger Customizer Offcanvas -->
					<div class="topbar-item d-none d-sm-flex">
						<button class="topbar-link" data-bs-toggle="offcanvas"
							data-bs-target="#theme-settings-offcanvas" type="button">
							<i class="ti ti-settings fs-22"></i>
						</button>
					</div>

					<!-- Light/Dark Mode Button -->
					<div class="topbar-item d-none d-sm-flex">
						<button class="topbar-link" id="light-dark-mode" type="button">
							<i class="ti ti-moon fs-22"></i>
						</button>
					</div>

					<!-- User Dropdown -->
					<div class="topbar-item nav-user">
						<div class="dropdown">
							<a class="topbar-link dropdown-toggle drop-arrow-none px-2"
								data-bs-toggle="dropdown" data-bs-offset="0,19" type="button"
								aria-haspopup="false" aria-expanded="false"> <img
								src="resources/assets/images/users/avatar-1.jpg" width="32"
								class="rounded-circle me-lg-2 d-flex" alt="user-image"> <span
								class="d-lg-flex flex-column gap-1 d-none">
									<h5 class="my-0">Dhanoo K.</h5>
									<h6 class="my-0 fw-normal">Premium</h6>
							</span> <i
								class="ti ti-chevron-down d-none d-lg-block align-middle ms-2"></i>
							</a>
							<div class="dropdown-menu dropdown-menu-end">
								<!-- item-->
								<div class="dropdown-header noti-title">
									<h6 class="text-overflow m-0">Welcome !</h6>
								</div>

								<!-- item-->
								<a href="javascript:void(0);" class="dropdown-item"> <i
									class="ti ti-user-hexagon me-1 fs-17 align-middle"></i> <span
									class="align-middle">My Account</span>
								</a>

								<!-- item-->
								<a href="javascript:void(0);" class="dropdown-item"> <i
									class="ti ti-wallet me-1 fs-17 align-middle"></i> <span
									class="align-middle">Wallet : <span class="fw-semibold">$985.25</span></span>
								</a>

								<!-- item-->
								<a href="javascript:void(0);" class="dropdown-item"> <i
									class="ti ti-settings me-1 fs-17 align-middle"></i> <span
									class="align-middle">Settings</span>
								</a>

								<!-- item-->
								<a href="javascript:void(0);" class="dropdown-item"> <i
									class="ti ti-lifebuoy me-1 fs-17 align-middle"></i> <span
									class="align-middle">Support</span>
								</a>

								<div class="dropdown-divider"></div>

								<!-- item-->
								<a href="javascript:void(0);" class="dropdown-item"> <i
									class="ti ti-lock-square-rounded me-1 fs-17 align-middle"></i>
									<span class="align-middle">Lock Screen</span>
								</a>

								<!-- item-->
								<a href="javascript:void(0);"
									class="dropdown-item active fw-semibold text-danger"> <i
									class="ti ti-logout me-1 fs-17 align-middle"></i> <span
									class="align-middle">Sign Out</span>
								</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</header>
		<!-- Topbar End -->

		<!-- Search Modal -->
		<div class="modal fade" id="searchModal" tabindex="-1"
			aria-labelledby="searchModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-lg">
				<div class="modal-content bg-transparent">
					<div class="card mb-1">
						<div class="px-3 py-2 d-flex flex-row align-items-center"
							id="top-search">
							<i class="ti ti-search fs-22"></i> <input type="search"
								class="form-control border-0" id="search-modal-input"
								placeholder="Search for actions, people,">
							<button type="button" class="btn p-0" data-bs-dismiss="modal"
								aria-label="Close">[esc]</button>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- ============================================================== -->
		<!-- Start Page Content here -->
		<!-- ============================================================== -->
		<div class="page-content">
			<div class="page-container">
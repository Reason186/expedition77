<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Register</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/styles/register.css">
</head>
<body>

	<div class="container">
		<div class="card">

			<h2 class="title">Create Account</h2>

			<c:if test="${not empty message}">
				<div class="toast">${message}</div>
			</c:if>

			<form action="${pageContext.request.contextPath }/register"
				method="post" class="form">

				<div class="input-group">
					<label class="label-large">Register As</label>

					<div class="role-switch">
						<label class="role-option"> <input type="radio"
							name="role" value="customer" checked id="roleCustomer"> <span>Customer</span>
						</label> <label class="role-option"> <input type="radio"
							name="role" value="guide" id="roleGuide"> <span>Guide</span>
						</label>
					</div>
				</div>

				<div class="input-group">
					<label>Full Name</label> <input type="text" name="fullName" placeholder="John Doe">
				</div>

				<div class="input-group">
					<label>Email</label> <input type="email" name="email" placeholder="you@example.com">
				</div>

				<div class="input-group">
					<label>Phone Number</label> <input type="text" name="phone" placeholder="9800000000">
				</div>

				<div class="input-group">
					<label>Password</label> <input type="password" name="password"
						placeholder="••••••••">
				</div>

				<div class="input-group">
					<label>Confirm Password</label> <input type="password" name="confirmPassword"
						placeholder="••••••••">
				</div>

				<div id="guideFields" style="display: none;">
					<div class="input-group">
						<label>Specialty</label>
						<input type="text" name="specialty" placeholder="e.g. Everest Specialist">
					</div>
					<div class="input-group">
						<label>Years of Experience</label>
						<input type="number" name="experience" placeholder="e.g. 5" min="0">
					</div>
					<div class="input-group">
						<label>Short Bio</label>
						<textarea name="bio" rows="3" placeholder="Tell trekkers about yourself..."
							style="width:100%; padding:10px 14px; border:1px solid var(--primary-200); border-radius:8px; outline:none; font-size:14px; font-family:inherit; resize:vertical;"></textarea>
					</div>
				</div>

				<button type="submit" class="btn">Create Account</button>
			</form>

			<div class="divider">
				<div></div>
				<span>OR</span>
				<div></div>
			</div>

			<p class="footer-text">
				Already have an account? <a href="${pageContext.request.contextPath }/login">Login</a>
			</p>

		</div>
	</div>

	<script>
		var roleCustomer = document.getElementById("roleCustomer");
		var roleGuide = document.getElementById("roleGuide");
		var guideFields = document.getElementById("guideFields");

		roleCustomer.addEventListener("change", function() {
			guideFields.style.display = "none";
		});
		roleGuide.addEventListener("change", function() {
			guideFields.style.display = "block";
		});
	</script>

</body>
</html>
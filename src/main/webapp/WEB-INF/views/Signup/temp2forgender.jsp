<%@ page pageEncoding="UTF-8"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>my title</title>
</head>
<body>
<div class="gender-details">
					<spring:input type="radio" name="gender" id="dot-1" required="required" path=""/> 
					<spring:input type="radio" name="gender" id="dot-2" path=""/> 
					<spring:input type="radio" name="gender" id="dot-3" path=""/> 
					<span class="gender-title">Giới tính</span>
					<div class="category">
						<label for="dot-1"> <span class="dot one"></span> <span
							class="gender">Male</span>
						</label> <label for="dot-2"> <span class="dot two"></span> <span
							class="gender">Female</span>
						</label> <label for="dot-3"> <span class="dot three"></span> <span
							class="gender">Other</span>
						</label>
					</div>
				</div>
</body>
</html>
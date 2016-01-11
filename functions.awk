	
function toPay(payment){
	if (payment <= 125.99)
		return 0.5;
	else if (payment >= 126 && payment <= 199.99)
		return 2;
	else if (payment >= 200 && payment <= 299.99)
		return 4;
	else if (payment >= 300 && payment <= 399.99)
		return 8;
	else if (payment >= 400 && payment <= 499.99)
		return 15;
	else
		return payment * 0.03;
}

function reportHead(){
	printf("<table border=\"1\">\
				<tr align=\"center\" valign=\"middle\">\
					<th>ID</th>\
					<th>Name</th>\
					<th>Must pay?</th>\
					<th>Salary</th>\
					<th>Quotation</th>\
				</tr>");
}
	
function trim(str){
	tmp = str;
	gsub(/\ /,"",tmp);
	return tmp;
}
	
function trimFirstZero(str){
	tmp = str;
	gsub(/^0/,"",tmp);
	return tmp;
}
	
function reportRow(id, name, mustPay, salary, quota){
	printf("<tr>\n"); 
		printf("<td>%s</td>\
				<td>%s</td>\
				<td>%s</td>\
				<td>%.2f</td>\
				<td>%.2f</td>\n",
				id,
				name,
				(mustPay ? "YES" : "NO"),
				salary,
				quota);
	printf("</tr>\n");
}
	
function reportEnd(sum){
		printf("<tr>\n"); 
			printf("<td></td>\
			<td></td>\
			<td></td>\
			<td><u>Total amount</u></td>\
			<td>%.2f</td>\n",
			sum);
		printf("</tr>\n");
	printf("</table>\n");
}


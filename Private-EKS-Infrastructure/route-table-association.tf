#-------------------------Public-route-tabel-association-----------------------------

resource "aws_route_table_association" "public1" {
  subnet_id      = aws_subnet.pub-sub-1.id
  route_table_id = aws_route_table.public.id
}
resource "aws_route_table_association" "public2" {
  subnet_id      = aws_subnet.pub-sub-2.id
  route_table_id = aws_route_table.public.id
}



#-------------------------Private-route-tabel-association-----------------------------

resource "aws_route_table_association" "private1" {
  subnet_id      = aws_subnet.private-sub1.id
  route_table_id = aws_route_table.private.id
}

resource "aws_route_table_association" "private2" {
  subnet_id      = aws_subnet.private-sub2.id
  route_table_id = aws_route_table.private.id
}

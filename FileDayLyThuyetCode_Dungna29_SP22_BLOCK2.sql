/* T-SQL - Structured Query Language: Ngôn ngữ truy vấn có cấu trúc SQL cho phép Tạo CSDL, Thao tác trên dữ liệu
		(Lưu trữ dữ liệu, Sửa dữ liệu, Xóa dữ liệu) Đa số các RDBMS hiện nay sử dụng SQL (MS SQL Server – T- SQL, 
		Microsoft Access, Oracle – PL/SQL, DB2, MySQL…) [DungNA29]
Có thể chia thành 4 nhóm lệnh SQL:
	+ Nhóm truy vấn dữ liệu (DQL): gồm các lệnh truy vấn lựa chọn
	(Select) để lấy thông tin nhưng không làm thay đổi dữ liệu trong các bảng
	+ Nhóm định nghĩa dữ liệu (DDL): Gồm các lệnh tạo, thay đổi các bảng dữ liệu(Create, Drop, Alter, …)
	+ Nhóm thao tác dữ liệu (DML): Gồm các lệnh làm thay đổi dữ liệu (Insert, Delete, Update,…) lưu trong các bảng
	+ Nhóm điều khiển dữ liệu (DCL): Gồm các lệnh quản lý quyền truy nhập vào dữ liệu và các bảng (Grant, Revoke, …)
SQL KHÔNG PHÂN BIỆT CHỮA HOA CHỮ THƯỜNG. [DungNA29]
NGUYÊN TẮC KHI ĐẶT TÊN
	+ Kí tự đầu tiên của một định danh phải là một kí tự chữ cái theo chuẩn Unicode 2.0, hoặc dấu (_),
	hoặc dấu @ (tên biến), hoặc # (bảng tạm).
    + Không trùng với các từ khoá và từ dành riêng của ngôn ngữ T-SQL
    + Không chứa các kí tự đặt biệt +, -, *, /, !, ~, | ....
    + Ví dụ tên hợp lệ: Nhan_vien, _PhongBan
    + Tên không hợp lệ: [%], SELECT
    [DungNA29]
	Ctrl + E = Exxcute câu lệnh khi bôi đen vùng lệnh.
	*/

-- Câu lệnh 1.1: COMMENT TRONG SQL --	
-- (2 dấu gạch liên tiếp): Comment trên một dòng và chỉ có tác dụng trên 1 dòng DungNA29
/*..Comment trên một khối.. */

/*
	CÂU LỆNH 1.2: CREATE DATABASE
	ĐỊNH NGHĨA: DÙNG ĐỂ TẠO 1 DATABASE TRONG CSDL
	CÔNG THỨC: 
	CREATE DATABASE database_name;
*/
CREATE DATABASE CP17310_FPTShop_SP22_BL2

-- File Query khi mở lên không tự nhận diện DB, Mỗi lần mở lên sẽ chọn cơ sở dữ liệu cần làm việc ở bên cạnh Excute hoặc dùng câu lệnh
USE CP17310_FPTShop_SP22_BL2

/*
	CÂU LỆNH 1.3: DROP DATABASE
	ĐỊNH NGHĨA: XÓA DATABASE TRONG CSDL
	CÔNG THỨC: 
	DROP DATABASE database_name;
*/
DROP DATABASE CP17310_FPTShop_SP22_BL2

/*
  Một vài phím tắt:
  1. Ctrl + E Khi bôi vùng code cần chạy
  2. Ctrl + Shift + U = Viết hóa
  3. Ctrl + Shift + L = Viết thường
*/
/*
	CÂU LỆNH 1.4: CREATE TABLE
	ĐỊNH NGHĨA: TẠO BẢNG TRONG CSDL
	CÔNG THỨC: 
	CREATE TABLE table_name (
    column1 datatype,
    column2 datatype,
    column3 datatype,
   ....
	);
*/
-- Tạo khóa chính cách 1
CREATE TABLE SANPHAM(
ID INT PRIMARY KEY IDENTITY,
MA VARCHAR(20) UNIQUE,
TEN NVARCHAR(100) DEFAULT NULL
)
-- Tạo khóa chính cách 2
CREATE TABLE SANPHAM(
ID INT,
MA VARCHAR(20) UNIQUE,
TEN NVARCHAR(100) DEFAULT NULL,
PRIMARY KEY(ID)
)
-- Tạo khóa chính cách 3
CREATE TABLE SANPHAM(
ID INT NOT NULL PRIMARY KEY,
MA VARCHAR(20) UNIQUE,
TEN NVARCHAR(100) DEFAULT NULL
)
-- Tạo khóa chính cách 4
CREATE TABLE SANPHAM(
ID INT,
MA VARCHAR(20) UNIQUE,
TEN NVARCHAR(100) DEFAULT NULL,
CONSTRAINT PK_SP PRIMARY KEY (ID,MA) --CONSTRAINT chỉ ra quy tắc mà dữ liệu phải tuân theo
)
-- Trong ví dụ cách 4 chỉ có rằng buộc PK_SP. Tuy nhiên, Giá trị của khóa chính được hình thành từ 2 cột (ID,MA)

/*
	CÂU LỆNH 1.5: DROP TABLE
	ĐỊNH NGHĨA: XÓA BẢNG TRONG CSDL
	CÔNG THỨC: 
	DROP TABLE table_name;
*/
DROP TABLE dbo.SANPHAM
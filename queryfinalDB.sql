USE final;

/*1*/
CREATE PROCEDURE usp_1
AS
SELECT a1.book_title, a2.branch_name, a3.copies_num FROM tbl_copies a3
INNER JOIN tbl_branch a2 ON copies_branch = branch_id
INNER JOIN tbl_books a1 ON copies_book_id = book_id
WHERE branch_name = 'Sharpstown' AND book_title = 'The Lost Tribe'
GO


/*2*/
CREATE PROCEDURE usp_2
AS
SELECT b3.book_title, b2.branch_name, b1.copies_num FROM tbl_copies b1
INNER JOIN tbl_books b3 ON copies_book_id = book_id
INNER JOIN tbl_branch b2 ON copies_branch = branch_id
WHERE book_title = 'The Lost Tribe'
GO


/*3*/
/*In this DB every borrower has checked out at least one book, so the query checks whether the borrower is in the loan table
OR whether the loan's due date has already passed as of today (@DueDate in format INT like this: YYYMMDD), which assumes that all books have been returned on time. */

CREATE PROCEDURE usp_3 @DueDate INT
AS
SELECT * FROM tbl_borrower c1
INNER JOIN tbl_loans c2 ON bor_no = loan_card
WHERE bor_no NOT IN (loan_card) OR @DueDate> loan_due
GO


/*4*/
CREATE PROCEDURE usp_4 @Today INT
AS
SELECT d1.book_title, d2.bor_name, d2.bor_address FROM tbl_loans d3
INNER JOIN tbl_books d1 ON loan_book_id = book_id
INNER JOIN tbl_borrower d2 ON loan_card = bor_no
INNER JOIN tbl_branch ON loan_branch_id = branch_id
WHERE branch_name = 'Sharpstown' and d3.loan_due = @Today
GO


/*5*/


CREATE PROCEDURE usp_5
AS
DECLARE @Counter INT = 1,
		@Branchname VARCHAR(15),
		@Loans INT

WHILE (@Counter<5)
BEGIN
SELECT @Branchname = branch_name FROM tbl_branch WHERE branch_id = @Counter
SELECT @Loans = COUNT(*) FROM tbl_loans WHERE loan_branch_id = @Counter

SELECT @Branchname, @Loans
SET @Counter = @Counter + 1
END
GO

/*6*/
CREATE PROCEDURE usp_6
AS
DECLARE @Counter INT=1,
		@BorName VARCHAR(30),
		@Loans INT,
		@Addr VARCHAR(40)

WHILE (@Counter<11)
BEGIN
SELECT @Borname = bor_name  FROM tbl_borrower WHERE bor_no = @Counter
SELECT @Loans = COUNT(*) FROM tbl_loans WHERE loan_card = @Counter

IF (@Loans > 5)
BEGIN
SELECT @Addr = bor_address FROM tbl_borrower WHERE bor_no = @Counter
SELECT @BorName, @Addr, @Loans
END

SET @Counter = @Counter + 1
END
GO

/*7*/
CREATE PROCEDURE usp_7
AS
SELECT f1.book_title, f2.copies_num FROM tbl_books f1
INNER JOIN tbl_copies f2 ON book_id = copies_book_id
INNER JOIN tbl_author f3 ON f1.book_id = author_book_id
INNER JOIN tbl_branch f4 ON f2.copies_branch = branch_id
WHERE author_name = 'Stephen King' AND branch_name = 'Central';
GO





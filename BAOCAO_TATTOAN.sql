-- TẠO BẢNG BÁO CÁO THEO TEMPLATE
DROP TABLE [Report on Settlement Situation in the First 6 Months of the Year]
CREATE TABLE [Report on Settlement Situation in the First 6 Months of the Year](
   STT				Int
  ,[TIEU CHI]			Nvarchar(100)
  ,[QUY I]			bigint
  ,[QUY II]			bigint
  ,[QUY III]			bigint
  ,[QUY IV]			bigint
);
 
-- INSERT FIXED INFORMATION INTO REPORT

INSERT INTO [Report on Settlement Situation in the First 6 Months of the Year]
(
	 STT
	,[TIEU CHI]
	,[QUY I]
	,[QUY II]	
	,[QUY III]
	,[QUY IV]
)
VALUES
 (1,N'Số tiền gốc phải trả',NULL,NULL,NULL,NULL)
,(2,N'Số tiền lãi phải trả',NULL,NULL,NULL,NULL)
,(3,N'Tổng',NULL,NULL,NULL,NULL)

UPDATE [Report on Settlement Situation in the First 6 Months of the Year]
	SET [QUY I] =
	(
		CASE WHEN [TIEU CHI] = N'Số tiền gốc phải trả' THEN (SELECT SUM(Value) FROM SAVING_ACCOUNT WHERE Sav_end_date BETWEEN '2024-01-01' AND '2024-03-31')
		     WHEN [TIEU CHI] = N'Số tiền lãi phải trả' THEN 
				(SELECT 
					ROUND(SUM(((Value * interest/100)/365) * DATEDIFF(DAY,Sav_Date,Sav_end_date)),0) -- Tính toán lãi theo ngày
				FROM SAVING_ACCOUNT
				WHERE DATEPART(QUARTER,SAV_END_DATE) = 1 AND YEAR(Sav_end_date)=2024)
		   	 WHEN [TIEU CHI] = N'Tổng'				   THEN
			 (
			 (SELECT SUM(Value) FROM SAVING_ACCOUNT WHERE Sav_end_date BETWEEN '2024-01-01' AND '2024-03-31')
			 +
			 (SELECT 
				ROUND(SUM(((Value * interest/100)/365) * DATEDIFF(DAY,Sav_Date,Sav_end_date)),0)
			 FROM SAVING_ACCOUNT
			 WHERE DATEPART(QUARTER,SAV_END_DATE) = 1 AND YEAR(Sav_end_date)=2024)
			 )
			 END
	)

UPDATE [Report on Settlement Situation in the First 6 Months of the Year]
	SET [QUY II] =
	(
		CASE WHEN [TIEU CHI] = N'Số tiền gốc phải trả' THEN (SELECT SUM(Value) FROM SAVING_ACCOUNT WHERE Sav_end_date BETWEEN '2024-04-01' AND '2024-06-30')
		     WHEN [TIEU CHI] = N'Số tiền lãi phải trả' THEN 
				(SELECT 
					ROUND(SUM(((Value * interest/100)/365) * DATEDIFF(DAY,Sav_Date,Sav_end_date)),0) -- Tính toán lãi theo ngày
				FROM SAVING_ACCOUNT
				WHERE DATEPART(QUARTER,SAV_END_DATE) = 2 AND YEAR(Sav_end_date)=2024)
		   	 WHEN [TIEU CHI] = N'Tổng'				   THEN
			 (
			 (SELECT SUM(Value) FROM SAVING_ACCOUNT WHERE Sav_end_date BETWEEN '2024-04-01' AND '2024-06-30')
			 +
			 (SELECT 
				ROUND(SUM(((Value * interest/100)/365) * DATEDIFF(DAY,Sav_Date,Sav_end_date)),0)
			 FROM SAVING_ACCOUNT
			 WHERE DATEPART(QUARTER,SAV_END_DATE) = 2 AND YEAR(Sav_end_date)=2024)
			 )
			 END
	)

UPDATE [Report on Settlement Situation in the First 6 Months of the Year]
	SET [QUY III] =
	(
		CASE WHEN [TIEU CHI] = N'Số tiền gốc phải trả' THEN (SELECT SUM(Value) FROM SAVING_ACCOUNT WHERE Sav_end_date BETWEEN '2024-07-01' AND '2024-09-30')
		     WHEN [TIEU CHI] = N'Số tiền lãi phải trả' THEN 
				(SELECT 
					ROUND(SUM(((Value * interest/100)/365) * DATEDIFF(DAY,Sav_Date,Sav_end_date)),0) -- Tính toán lãi theo ngày
				FROM SAVING_ACCOUNT
				WHERE DATEPART(QUARTER,SAV_END_DATE) = 3 AND YEAR(Sav_end_date)=2024)
		   	 WHEN [TIEU CHI] = N'Tổng'				   THEN
			 (
			 (SELECT SUM(Value) FROM SAVING_ACCOUNT WHERE Sav_end_date BETWEEN '2024-07-01' AND '2024-09-30')
			 +
			 (SELECT 
				ROUND(SUM(((Value * interest/100)/365) * DATEDIFF(DAY,Sav_Date,Sav_end_date)),0)
			 FROM SAVING_ACCOUNT
			 WHERE DATEPART(QUARTER,SAV_END_DATE) = 3 AND YEAR(Sav_end_date)=2024)
			 )
			 END
	)

UPDATE [Report on Settlement Situation in the First 6 Months of the Year]
	SET [QUY IV] =
	(
		CASE WHEN [TIEU CHI] = N'Số tiền gốc phải trả' THEN (SELECT SUM(Value) FROM SAVING_ACCOUNT WHERE Sav_end_date BETWEEN '2024-10-01' AND '2024-12-31')
		     WHEN [TIEU CHI] = N'Số tiền lãi phải trả' THEN 
				(SELECT 
					ROUND(SUM(((Value * interest/100)/365) * DATEDIFF(DAY,Sav_Date,Sav_end_date)),0) -- Tính toán lãi theo ngày
				FROM SAVING_ACCOUNT
				WHERE DATEPART(QUARTER,SAV_END_DATE) = 4 AND YEAR(Sav_end_date)=2024)
		   	 WHEN [TIEU CHI] = N'Tổng'				   THEN
			 (
			 (SELECT SUM(Value) FROM SAVING_ACCOUNT WHERE Sav_end_date BETWEEN '2024-10-01' AND '2024-12-31')
			 +
			 (SELECT 
				ROUND(SUM(((Value * interest/100)/365) * DATEDIFF(DAY,Sav_Date,Sav_end_date)),0)
			 FROM SAVING_ACCOUNT
			 WHERE DATEPART(QUARTER,SAV_END_DATE) = 4 AND YEAR(Sav_end_date)=2024)
			 )
			 END
	)

-- RESULT

SELECT * FROM [Report on Settlement Situation in the First 6 Months of the Year]

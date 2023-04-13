USE premiere;

INSERT INTO part (PART_NUM, DESCRIPTION, ON_HAND, CLASS, WAREHOUSE, PRICE)
 VALUES 
  ('AT94', 'Iron', 50, 'HW', '3', 24.95),
  ('BV06', 'Home Gym', 45, 'SG', '2', 794.95),
  ('CD52', 'Microwave Oven', 32, 'AP', '1', 165.00),
  ('DL71', 'Cordless Drill', 21, 'HW', '3', 129.95),
  ('DR93', 'Gas Range', 8, 'AP', '2', 495.00),
  ('DW11', 'Washer', 12, 'AP', '3', 399.99),
  ('FD21', 'Stand Mixer', 22, 'HW', '3', 159.95),
  ('KL62', 'Dryer', 12, 'AP', '1', 349.95),
  ('KT03', 'Dishwasher', 8, 'AP', '3', 595.00),
  ('KV29', 'Treadmill', 9, 'SG', '2', 1390.00);
  
 SELECT * FROM part;
 
 
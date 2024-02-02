TRUNCATE TABLE `dataform-tutorial-412218.landing.product`;
INSERT INTO `dataform-tutorial-412218.landing.product`
(
  ID,
  NAME,
  MANUFACTURE,
  CREATE_DATE
)
VALUES
  ('1','Coca-Cola','Coca-Cola Company','2020-01-01'),
  ('2','Pepsi','PepsiCo','2021-01-01');


TRUNCATE TABLE `dataform-tutorial-412218.landing.price`;
INSERT INTO `dataform-tutorial-412218.landing.price`
(
  PRODUCT_ID,
  PRICE,
  START_DATE,
  END_DATE
)
VALUES
  ('1','2.2','2022-01-01','2022-12-31'),
  ('1','4.2','2023-01-01','2023-12-31'),
  ('2','1.6','2022-01-01','2022-12-31'),
  ('2','3.0','2023-01-01','2023-12-31');

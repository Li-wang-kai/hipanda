SET NAMES UTF8;
DROP DATABASE IF EXISTS dazzle;
CREATE DATABASE chao CHARSET=UTF8;
USE dazzle;


/**��Ʒ����**/
CREATE TABLE dazzle_laptop_family(
  fid INT PRIMARY KEY AUTO_INCREMENT,
  fname VARCHAR(32),	      #��Ʒϵ������
  tid Int,		      #��Ʒ���η���
  hid Int		      #��Ʒ���η���
);

/**��Ʒ����**/
CREATE TABLE dazzle_laptop(
  lid INT PRIMARY KEY AUTO_INCREMENT,
  family_id INT,              #������Ʒ������
  title VARCHAR(128),         #������
  subtitle VARCHAR(128),      #������
  price DECIMAL(10,2),        #�۸�
  promise VARCHAR(64),        #�����ŵ
  spec VARCHAR(64),           #���/��ɫ

  lname VARCHAR(32),          #��Ʒ����
  details VARCHAR(10240),      #��Ʒ��ϸ˵��

  shelf_time BIGINT,          #�ϼ�ʱ��
  sold_count INT,             #���۳�������
  is_onsale BOOLEAN           #�Ƿ������
);

/**��ƷͼƬ**/
CREATE TABLE dazzle_laptop_pic(
  pid INT PRIMARY KEY AUTO_INCREMENT,
  laptop_id INT,              #��Ʒ���
  sm VARCHAR(128),            #СͼƬ·��
  md VARCHAR(128),            #��ͼƬ·��
  lg VARCHAR(128)             #��ͼƬ·��
);

/**�û���Ϣ**/
CREATE TABLE dazzle_user(
  uid INT PRIMARY KEY AUTO_INCREMENT,
  uname VARCHAR(32),
  upwd VARCHAR(32),
  email VARCHAR(64),
  phone VARCHAR(16),

  avatar VARCHAR(128),        #ͷ��ͼƬ·��
  user_name VARCHAR(32),      #�û���������С��
  gender INT                  #�Ա�  0-Ů  1-��
);

/**�ջ���ַ��Ϣ**/
CREATE TABLE dazzle_receiver_address(
  aid INT PRIMARY KEY AUTO_INCREMENT,
  user_id INT,                #�û����
  receiver VARCHAR(16),       #����������
  province VARCHAR(16),       #ʡ
  city VARCHAR(16),           #��
  county VARCHAR(16),         #��
  address VARCHAR(128),       #��ϸ��ַ
  cellphone VARCHAR(16),      #�ֻ�
  fixedphone VARCHAR(16),     #�̶��绰
  postcode CHAR(6),           #�ʱ�
  tag VARCHAR(16),            #��ǩ��

  is_default BOOLEAN          #�Ƿ�Ϊ��ǰ�û���Ĭ���ջ���ַ
);

/**���ﳵ��Ŀ**/
CREATE TABLE dazzle_shoppingcart_item(
  iid INT PRIMARY KEY AUTO_INCREMENT,
  user_id INT,      #�û����
  product_id INT,   #��Ʒ���
  count INT,        #��������
  is_checked BOOLEAN #�Ƿ��ѹ�ѡ��ȷ������
);

/**�û�����**/
CREATE TABLE dazzle_order(
  aid INT PRIMARY KEY AUTO_INCREMENT,
  user_id INT,
  address_id INT,
  status INT,             #����״̬  1-�ȴ�����  2-�ȴ�����  3-������  4-��ǩ��  5-��ȡ��
  order_time BIGINT,      #�µ�ʱ��
  pay_time BIGINT,        #����ʱ��
  deliver_time BIGINT,    #����ʱ��
  received_time BIGINT    #ǩ��ʱ��
)AUTO_INCREMENT=10000000;

/**�û�����**/
CREATE TABLE dazzle_order_detail(
  did INT PRIMARY KEY AUTO_INCREMENT,
  order_id INT,           #�������
  product_id INT,         #��Ʒ���
  count INT               #��������
);

/****��ҳ�ֲ������Ʒ****/
CREATE TABLE dazzle_index_carousel(
  cid INT PRIMARY KEY AUTO_INCREMENT,
  img VARCHAR(128),
  title VARCHAR(64),
  href VARCHAR(128)
);

/****��ҳ��Ʒ****/
CREATE TABLE dazzle_index_product(
  pid INT PRIMARY KEY AUTO_INCREMENT,
  title VARCHAR(64),
  details VARCHAR(128),
  pic VARCHAR(128),
  price DECIMAL(10,2),
  href VARCHAR(128),
  seq_recommended TINYINT,
  seq_new_arrival TINYINT,
  seq_top_sale TINYINT
);


USE PatrickSoppe
ZAP
APPEND FROM (GETFILE()) TYPE SDF
REPLACE ALL Quality WITH SUBSTR(Import,1,5),;
						Star WITH SUBSTR(Import,8,1),;
						Band WITH SUBSTR(Import,9,36),;
						Title WITH SUBSTR(Import,45,51),;
						Country WITH SUBSTR(Import,106,10),;
						Tracks WITH SUBSTR(Import,124,3),;
						Date WITH SUBSTR(Import,128,10),;
						Time WITH SUBSTR(Import,144,4)

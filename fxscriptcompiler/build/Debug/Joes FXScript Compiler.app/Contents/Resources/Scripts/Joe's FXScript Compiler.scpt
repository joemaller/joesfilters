FasdUAS 1.101.10   ��   ��    k             l     �� ��    * $ Joe's FXScript Compiler.applescript       	  l     �� 
��   
   Joe's FXScript Compiler    	     l     ������  ��        l     �� ��    ) #  Created by Joe Maller on 6/29/05.         l     �� ��    > 8  Copyright 2005 __MyCompanyName__. All rights reserved.         l     ������  ��        l     ������  ��        l     ������  ��        l     ������  ��        l     ������  ��        j     �� ��  0 preferredtypes preferredTypes  J           ! " ! m      # # 	 txt    "  $�� $ m     % %  fxscript   ��     & ' & j    �� (�� 0 maxprogress maxProgress ( m    ���� d '  ) * ) j   	 �� +�� &0 completedprogress completedProgress + m   	 
����   *  , - , l     ������  ��   -  . / . l     ������  ��   /  0 1 0 l      �� 2��   2 > 8 used by the FCP ccrash detection and recovery routines     1  3 4 3 j    �� 5�� 0 	loopcount   5 m    ����   4  6 7 6 j    �� 8�� 0 
crashcount   8 m    ����   7  9 : 9 j    �� ;�� 0 	starttime 	startTime ; m    ��
�� 
msng :  < = < l     ������  ��   =  > ? > p     @ @ ������ 
0 paused  ��   ?  A B A l     C�� C r      D E D m     ��
�� boovfals E o      ���� 
0 paused  ��   B  F G F l     ������  ��   G  H I H l     ������  ��   I  J K J l     ������  ��   K  L M L j    �� N�� 0 panelwindow panelWIndow N m    ��
�� 
msng M  O P O l     ������  ��   P  Q R Q l     ������  ��   R  S T S i     U V U I     �� W��
�� .appSwiFLnull���    obj  W o      ���� 0 	theobject 	theObject��   V k    * X X  Y Z Y l     ������  ��   Z  [ \ [ r      ] ^ ] J     ����   ^ o      ���� 0 filelist fileList \  _ ` _ r     a b a K    	 c c �� d���� 0 fullPath   d m     e e  /boogle/joe.gtml   ��   b n       f g f  ;   
  g o   	 
���� 0 filelist fileList `  h i h r     j k j K     l l �� m���� 0 fullPath   m m     n n  blah/joe   ��   k n       o p o  ;     p o    ���� 0 filelist fileList i  q r q I   �� s t
�� .appScalMnull���    obj  s m     u u  setValue:forKey:    t �� v��
�� 
witP v J     w w  x y x o    ���� 0 filelist fileList y  z�� z m     { {  srcFileList   ��  ��   r  | } | l     ������  ��   }  ~  ~ l      �� ���   � � �	
	set theText to call method "valueForKey:" with parameter "srcFileList"
	log "result of valueForKey:srcFileList: "
	log theText
      � � � l     �� ���   � � �	set outputFolders to {|fullEncoded|:"full", |demoEncoded|:"demo", |fullSourceCode|:"full code", |demoSourceCode|:"demo code"} -- these are the output folder names    �  � � � l     ������  ��   �  � � � l     �� ���   � U O	call method "setValue:forKey:" with parameters {fileList, "outputFolderNames"}    �  � � � l     ������  ��   �  � � � l      �� ���   � !  OUTPUT FOLDER PREFERENCES     �  � � � I    9���� �
�� .corecrel****      � null��   � �� � �
�� 
kocl � m   " #��
�� 
defE � �� � �
�� 
insh � n   $ * � � �  ;   ) * � n   $ ) � � � 2  ' )��
�� 
defE � 1   $ '��
�� 
useD � �� ���
�� 
prdt � K   + 3 � � �� � �
�� 
pnam � m   , - � �  fullEncoded    � �� ���
�� 
pcnt � m   . / � � 
 full   ��  ��   �  � � � I  : W���� �
�� .corecrel****      � null��   � �� � �
�� 
kocl � m   < =��
�� 
defE � �� � �
�� 
insh � n   > D � � �  ;   C D � n   > C � � � 2  A C��
�� 
defE � 1   > A��
�� 
useD � �� ���
�� 
prdt � K   E Q � � �� � �
�� 
pnam � m   F I � �  demoEncoded    � �� ���
�� 
pcnt � m   J M � � 
 demo   ��  ��   �  � � � I  X u���� �
�� .corecrel****      � null��   � �� � �
�� 
kocl � m   Z [��
�� 
defE � �� � �
�� 
insh � n   \ b � � �  ;   a b � n   \ a � � � 2  _ a��
�� 
defE � 1   \ _��
�� 
useD � �� ���
�� 
prdt � K   c o � � �� � �
�� 
pnam � m   d g � �  fullSourceCode    � �� ���
�� 
pcnt � m   h k � �  fullcode   ��  ��   �  � � � I  v ����� �
�� .corecrel****      � null��   � �� � �
�� 
kocl � m   x y��
�� 
defE � �� � �
�� 
insh � n   z � � � �  ;    � � n   z  � � � 2  } ��
�� 
defE � 1   z }��
�� 
useD � �� ���
�� 
prdt � K   � � � � �� � �
�� 
pnam � m   � � � �  demoSourceCode    � �� ��
�� 
pcnt � m   � � � �  	demo code   �  ��   �  � � � l  � ��~�}�~  �}   �  � � � l   � ��| ��|   � #  empty list for source files     �  � � � I  � ��{�z �
�{ .corecrel****      � null�z   � �y � �
�y 
kocl � m   � ��x
�x 
defE � �w � �
�w 
insh � n   � � � � �  ;   � � � n   � � � � � 2  � ��v
�v 
defE � 1   � ��u
�u 
useD � �t ��s
�t 
prdt � K   � � � � �r � �
�r 
pnam � m   � � � �  srcFileList    � �q ��p
�q 
pcnt � J   � ��o�o  �p  �s   �  � � � l  � ��n�m�n  �m   �  � � � l   � ��l ��l   �   Watermark      �  � � � I  � ��k�j �
�k .corecrel****      � null�j   � �i � �
�i 
kocl � m   � ��h
�h 
defE � �g � �
�g 
insh � n   � � � � �  ;   � � � n   � � � � � 2  � ��f
�f 
defE � 1   � ��e
�e 
useD � �d ��c
�d 
prdt � K   � � � � �b � �
�b 
pnam � m   � �    watermarkChooseFilePath    � �a�`
�a 
pcnt m   � �  ~   �`  �c   �  l  � � I  � ��_�^
�_ .corecrel****      � null�^   �]	
�] 
kocl m   � ��\
�\ 
defE	 �[

�[ 
insh
 n   � �  ;   � � n   � � 2  � ��Z
�Z 
defE 1   � ��Y
�Y 
useD �X�W
�X 
prdt K   � � �V
�V 
pnam m   � �  waterMarkSource    �U�T
�U 
pcnt m   � �      �T  �W   !  watermark source file path     l  �
 I  �
�S�R
�S .corecrel****      � null�R   �Q
�Q 
kocl m   � ��P
�P 
defE �O
�O 
insh n   � � !   ;   � �! n   � �"#" 2  � ��N
�N 
defE# 1   � ��M
�M 
useD �L$�K
�L 
prdt$ K   �%% �J&'
�J 
pnam& m   � �((  waterMarkText   ' �I)�H
�I 
pcnt) m   � **      �H  �K     watermark source code    +,+ l �G�F�G  �F  , -.- l  �E/�E  /   output folder path    . 010 I (�D�C2
�D .corecrel****      � null�C  2 �B34
�B 
kocl3 m  �A
�A 
defE4 �@56
�@ 
insh5 n  787  ;  8 n  9:9 2 �?
�? 
defE: 1  �>
�> 
useD6 �=;�<
�= 
prdt; K  "<< �;=>
�; 
pnam= m  ??  outputFolderPath   > �:@�9
�: 
pcnt@ m  AA  ~   �9  �<  1 BCB l ))�8�7�8  �7  C DED l ))�6�5�6  �5  E F�4F l ))�3�2�3  �2  �4   T GHG l     �1�0�1  �0  H IJI l     �/�.�/  �.  J KLK i    MNM I     �-O�,
�- .appSawFNnull���    obj O o      �+�+ 0 	theobject 	theObject�,  N k     HPP QRQ l     �*�)�*  �)  R STS Z     UV�(�'U =    WXW n     YZY 1    �&
�& 
pnamZ o     �%�% 0 	theobject 	theObjectX m    [[  watermarkView   V O   \]\ I   �$�#^
�$ .appSregInull���    obj �#  ^ �"_�!
�" 
draT_ J    `` aba m    cc  
file names   b d� d m    ee 
 text   �   �!  ] o    	�� 0 	theobject 	theObject�(  �'  T fgf l   ���  �  g hih Z    6jk��j =   !lml n    non 1    �
� 
pnamo o    �� 0 	theobject 	theObjectm m     pp  fileListView   k k   $ 2qq rsr l  $ $�t�  t f `		set content of theObject to (contents of default entry "srcFileList" of user defaults as list)   s uvu l  $ $���  �  v w�w O  $ 2xyx I  ( 1��z
� .appSregInull���    obj �  z �{�
� 
draT{ J   * -|| }�} m   * +~~  
file names   �  �  y o   $ %�� 0 	theobject 	theObject�  �  �  i � l  7 7���  �  � ��� Z   7 H����
� =  7 <��� n   7 :��� 1   8 :�	
�	 
pnam� o   7 8�� 0 	theobject 	theObject� m   : ;��  aPanel   � I  ? D���
� .ascrcmnt****      � ****� m   ? @��  New Panel Loaded   �  �  �
  �  L ��� l     ���  �  � ��� l     ���  �  � ��� i     #��� I     ���
� .drADdroRnull���    obj � o      � �  0 	theobject 	theObject� �����
�� 
draI� o      ���� 0 draginfo dragInfo��  � k    �� ��� r     ��� n     ��� 1    ��
�� 
typP� n     ��� m    ��
�� 
pasE� o     ���� 0 draginfo dragInfo� o      ���� 0 	datatypes 	dataTypes� ��� r    ��� m    	��  
file names   � n      ��� 1    ��
�� 
preQ� n   	 ��� m   
 ��
�� 
pasE� o   	 
���� 0 draginfo dragInfo� ��� l   ������  ��  � ��� Z    }������� =   ��� n    ��� 1    ��
�� 
pnam� o    ���� 0 	theobject 	theObject� m    ��  fileListView   � k    y�� ��� l   �����  �   		log content of theObject   � ���� Z    y������� E   ��� o    ���� 0 	datatypes 	dataTypes� m    ��  
file names   � k    u�� ��� l   ������  ��  � ��� r    "��� J     ����  � o      ���� 0 thefiles theFiles� ��� l  # #�����  �  	set fileList to {}   � ��� l  # #������  ��  � ��� l  # #�����  � 0 * Get the list of files from the pasteboard   � ��� r   # *��� n   # (��� 1   & (��
�� 
pcnt� n   # &��� m   $ &��
�� 
pasE� o   # $���� 0 draginfo dragInfo� o      ���� 0 thefiles theFiles� ��� l  + +������  ��  � ��� l  + 7��� r   + 7��� c   + 5��� n   + 3��� 1   1 3��
�� 
pcnt� n   + 1��� 4   . 1���
�� 
defE� m   / 0��  srcFileList   � 1   + .��
�� 
useD� m   3 4��
�� 
list� o      ���� 0 filelist fileList� 6 0 load array from user defaults to populate array   � ��� l  8 8������  ��  � ��� X   8 e����� r   H `��� K   H ]�� ������ 0 fullPath  � o   I J���� 0 theitem theItem� ������� 0 fileName  � n   M Y��� 1   W Y��
�� 
pnam� l  M W���� I  M W�����
�� .sysonfo4asfe        file� 4   M S���
�� 
psxf� o   Q R���� 0 theitem theItem��  ��  ��  � n      ���  ;   ^ _� o   ] ^���� 0 filelist fileList�� 0 theitem theItem� o   ; <���� 0 thefiles theFiles� ��� l  f f������  ��  � ��� r   f r��� o   f g���� 0 filelist fileList� n      ��� 1   o q��
�� 
pcnt� n   g o� � 4   j o��
�� 
defE m   k n  srcFileList     1   g j��
�� 
useD�  l  s s������  ��   �� L   s u m   s t��
�� boovtrue��  ��  ��  ��  ��  ��  �  l  ~ ~������  ��   	
	 Z   ~���� =  ~ � n   ~ � 1    ���
�� 
pnam o   ~ ���� 0 	theobject 	theObject m   � �  watermarkView    k   �  l  � �������  ��   �� Z   ����� E  � � o   � ����� 0 	datatypes 	dataTypes m   � �  
file names    k   �  l  � �������  ��    l  � ��� ��    0 * Get the list of files from the pasteboard    !"! r   � �#$# n   � �%&% 1   � ���
�� 
pcnt& n   � �'(' m   � ���
�� 
pasE( o   � ����� 0 draginfo dragInfo$ o      ���� 0 thefiles theFiles" )*) l  � �������  ��  * +,+ I  � ���-��
�� .ascrcmnt****      � ****- l  � �.��. I  � ���/��
�� .corecnte****       ****/ o   � ����� 0 thefiles theFiles��  ��  ��  , 010 Z   � �23��42 ?   � �565 l  � �7��7 I  � ���8��
�� .corecnte****       ****8 o   � ����� 0 thefiles theFiles��  ��  6 m   � ����� 3 L   � �99 I   � ���:���� 0 
showstatus 
showStatus: ;<; m   � �==  Please drop a single file   < >��> m   � ���
�� boovfals��  ��  ��  4 k   � �?? @A@ I   � ���B���� 0 
showstatus 
showStatusB CDC m   � �EE      D F��F m   � ���
�� boovtrue��  ��  A G��G l  � �������  ��  ��  1 HIH l  � �������  ��  I J��J Z   �KL����K I   � ���M���� 0 
istextfile 
isTextFileM N��N n   � �OPO 4   � ���Q
�� 
cobjQ m   � ����� P o   � ����� 0 thefiles theFiles��  ��  L k   �RR STS I  � ���U��
�� .ascrcmnt****      � ****U c   � �VWV n   � �XYX 4   � ���Z
�� 
cobjZ m   � ����� Y o   � ����� 0 thefiles theFilesW m   � ���
�� 
ctxt��  T [\[ l  � �������  ��  \ ]^] r   � �_`_ I  � ��a�~
� .sysoexecTEXT���     TEXTa b   � �bcb m   � �dd 
 cat    c l  � �e�}e c   � �fgf n   � �hih 1   � ��|
�| 
strqi n   � �jkj 4   � ��{l
�{ 
cobjl m   � ��z�z k o   � ��y�y 0 thefiles theFilesg m   � ��x
�x 
ctxt�}  �~  ` o      �w�w 0 thetext theText^ mnm l  � ��vo�v  o [ U use the cocoa whatever with file method to populate this instead of the shell script   n pqp l  � ��u�t�u  �t  q rsr r   �tut o   � ��s�s 0 thetext theTextu n      vwv 1   � �r
�r 
pcntw n   � �xyx 4   � ��qz
�q 
defEz m   � �{{  waterMarkText   y 1   � ��p
�p 
useDs |}| l �o�n�o  �n  } ~�m~ L   m  �l
�l boovtrue�m  ��  ��  ��  ��  ��  ��  ��  ��  
 ��� l ��� r  ��� m  ��      � n      ��� 1  �k
�k 
preQ� n  ��� m  �j
�j 
pasE� o  �i�i 0 draginfo dragInfo�  - restore preferred types   � ��h� L  �� m  �g
�g boovfals�h  � ��� l     �f�e�f  �e  � ��� i   $ '��� I     �d��c
�d .coVScliInull���    obj � o      �b�b 0 	theobject 	theObject�c  � k    K�� ��� I    �a��`
�a .ascrcmnt****      � ****� c     ��� b     ��� m     ��  	clicked:    � n    ��� 1    �_
�_ 
pnam� o    �^�^ 0 	theobject 	theObject� m    �]
�] 
ctxt�`  � ��� Z    ����\�[� =   ��� n    ��� 1    �Z
�Z 
pnam� o    �Y�Y 0 	theobject 	theObject� m    ��  
chooseFile   � k    ��� ��� O    &��� k    %�� ��� r    ��� m    �X
�X boovtrue� 1    �W
�W 
caCF� ��V� r     %��� m     !�U
�U boovtrue� 1   ! $�T
�T 
alMT�V  � 1    �S
�S 
opeP� ��� I  ' I�R��
�R .panSdisPnull���    obj � 1   ' *�Q
�Q 
opeP� �P��
�P 
in D� I   + 1�O��N�O &0 fetchuserdefaults fetchUserDefaults� ��M� m   , -��  watermarkChooseFilePath   �M  �N  � �L��
�L 
wiFN� m   2 3��  	SomeFile?   � �K��J
�K 
foFT� J   4 C�� ��� m   4 5�� 	 txt   � ��� m   5 6�� 	 css   � ��� m   6 9�� 	 bin   � ��� m   9 <��      � ��I� m   < ?��  fxscript   �I  �J  � ��H� Z   J ����G�F� =  J O��� l  J M��E� 1   J M�D
�D 
rslt�E  � m   M N�C�C � k   R ��� ��� I  R a�B��A
�B .ascrcmnt****      � ****� c   R ]��� n   R Y��� 1   U Y�@
�@ 
filO� 1   R U�?
�? 
opeP� m   Y \�>
�> 
list�A  � ��� I   b q�=��<�= "0 setuserdefaults setUserDefaults� ��� n   c j��� 1   f j�;
�; 
dirC� 1   c f�:
�: 
opeP� ��9� m   j m��  watermarkChooseFilePath   �9  �<  � ��� r   r ��� c   r }��� n   r y��� 1   u y�8
�8 
filO� 1   r u�7
�7 
opeP� m   y |�6
�6 
list� o      �5�5 0 thefiles theFiles� ��� I  � ��4��3
�4 .ascrcmnt****      � ****� o   � ��2�2 0 thefiles theFiles�3  � ��� r   � ���� I  � ��1��0
�1 .sysoexecTEXT���     TEXT� b   � ���� m   � ��� 
 cat    � l  � ���/� c   � ���� n   � ���� 1   � ��.
�. 
strq� n   � �   4   � ��-
�- 
cobj m   � ��,�,  o   � ��+�+ 0 thefiles theFiles� m   � ��*
�* 
ctxt�/  �0  � o      �)�) 0 thetext theText�  l  � � I   � ��(�'�( "0 setuserdefaults setUserDefaults 	 n   � �

 4   � ��&
�& 
cobj m   � ��%�%  o   � ��$�$ 0 thefiles theFiles	 �# m   � �  waterMarkSource   �#  �'   !  save watermark source path    �" l  � � I   � ��!� �! "0 setuserdefaults setUserDefaults  o   � ��� 0 thetext theText � m   � �  waterMarkText   �  �    7 1 store watermark source text (possibly lose this)   �"  �G  �F  �H  �\  �[  �  l  � ����  �    Z   � ��� =  � � n   � �  1   � ��
� 
pnam  o   � ��� 0 	theobject 	theObject m   � �!!  chooseOutputPath    k   � �"" #$# r   � �%&% I  � ����
� .sysostflalis    ��� null�  �  & o      �� 0 	thefolder 	theFolder$ '�' I   � ��(�� "0 setuserdefaults setUserDefaults( )*) o   � ��� 0 	thefolder 	theFolder* +�+ m   � �,,  outputFolderPath   �  �  �  �  �   -.- l  � ����  �  . /0/ Z   �12��1 =  � �343 n   � �565 1   � ��

�
 
pnam6 o   � ��	�	 0 	theobject 	theObject4 m   � �77  compile   2 I   ��8�� 0 	docompile 	doCompile8 9�9 c   � �:;: n   � �<=< 1   � ��
� 
pcnt= n   � �>?> 4   � ��@
� 
defE@ m   � �AA  srcFileList   ? 1   � ��
� 
useD; m   � ��
� 
list�  �  �  �  0 BCB l �� �  �   C DED Z  FG����F = HIH n  	JKJ 1  	��
�� 
pnamK o  ���� 0 	theobject 	theObjectI m  	LL  resetSubfolderNames   G I  �������� (0 resetoutputfolders resetOutputFolders��  ��  ��  ��  E MNM l ������  ��  N OPO Z  -QR����Q = !STS n  UVU 1  ��
�� 
pnamV o  ���� 0 	theobject 	theObjectT m   WW  
idleButton   R I  $)�������� 0 dopausepanel doPausePanel��  ��  ��  ��  P XYX l ..������  ��  Y Z[Z Z  .I\]����\ = .5^_^ n  .1`a` 1  /1��
�� 
pnama o  ./���� 0 	theobject 	theObject_ m  14bb  closer   ] I 8E��cd
�� .panScloPnull���    obj c l 8=e��e n  8=fgf m  9=��
�� 
cwing o  89���� 0 	theobject 	theObject��  d ��h��
�� 
witSh m  @A���� ��  ��  ��  [ i��i l JJ������  ��  ��  � jkj l     ������  ��  k lml i   ( +non I      �������� 0 dopausepanel doPausePanel��  ��  o l    Lpqp k     Lrr sts l     ������  ��  t uvu Z     wx����w =    yzy o     ���� 0 panelwindow panelWIndowz m    ��
�� 
msngx k   
 {{ |}| I  
 ��~��
�� .appSloaNnull���    obj ~ m   
   panel   ��  } ���� r    ��� 4    ���
�� 
cwin� m    ��  aPanel   � o      ���� 0 panelwindow panelWIndow��  ��  ��  v ��� l   ������  ��  � ��� l   ������  ��  � ��� r    "��� m     ��
�� boovtrue� o      ���� 
0 paused  � ��� I  # 1����
�� .panSdisQnull���    obj � o   # (���� 0 panelwindow panelWIndow� �����
�� 
attT� 4   ) -���
�� 
cwin� m   + ,�� 
 main   ��  � ��� V   2 J��� k   : E�� ��� I  : ?�����
�� .ascrcmnt****      � ****� m   : ;��  paused   ��  � ���� I  @ E�����
�� .sysodelanull��� ��� nmbr� m   @ A���� ��  ��  � =  6 9��� o   6 7���� 
0 paused  � m   7 8��
�� boovtrue� ���� l  K K������  ��  ��  q !  this shows the pause panel   m ��� l     ������  ��  � ��� l     ������  ��  � ��� i   , /��� I     ����
�� .panSpanEnull���    obj � o      ���� 0 	theobject 	theObject� �����
�� 
witS� o      ���� 0 
withresult 
withResult��  � k     	�� ��� l     �����  � ' ! add handler for quitting, etc...   � ��� I    �����
�� .ascrcmnt****      � ****� o     ���� 0 
withresult 
withResult��  � ���� r    	��� m    ��
�� boovfals� o      ���� 
0 paused  ��  � ��� l     ������  ��  � ��� l     ������  ��  � ��� l     ������  ��  � ��� l     ������  ��  � ��� l     ������  ��  � ��� l     ������  ��  � ��� l     ������  ��  � ��� l     ������  ��  � ��� l      �����  � G A two keystroke saving subroutines for working with User Defaults    � ��� i   0 3��� I      ������� &0 fetchuserdefaults fetchUserDefaults� ���� o      ���� 0 thekey theKey��  ��  � L     
�� n     	��� 1    ��
�� 
pcnt� n     ��� 4    ���
�� 
defE� o    ���� 0 thekey theKey� 1     ��
�� 
useD� ��� l     ������  ��  � ��� i   4 7��� I      ������� "0 setuserdefaults setUserDefaults� ��� o      ���� 0 thevalue theValue� ���� o      ���� 0 thekey theKey��  ��  � r     
��� o     ���� 0 thevalue theValue� n      ��� 1    	��
�� 
pcnt� n    ��� 4    ���
�� 
defE� o    ���� 0 thekey theKey� 1    ��
�� 
useD� ��� l     ������  ��  � ��� l     ������  ��  � ��� i   8 ;��� I      ������ 0 	docompile 	doCompile� ��~� o      �}�} 0 filelist fileList�~  �  � k    ��� ��� l    ��� r     ��� m     �|�|  � o      �{�{ &0 completedprogress completedProgress� , & reset progress bar for new iteration.   � ��� l   �z�y�z  �y  � ��� r    ��� m    	�x�x  � o      �w�w 0 	loopcount  � ��� r       m    �v�v   o      �u�u 0 
crashcount  �  r    # I   �t�s�r
�t .misccurdldt    ��� null�s  �r   o      �q�q 0 	starttime 	startTime  l  $ $�p�o�p  �o   	 l  $ $�n�m�n  �m  	 

 I   $ +�l�k�l 0 
showstatus 
showStatus  m   % &  Building Output folders    �j m   & '�i
�i boovtrue�j  �k    l  , ,�h�g�h  �g    l  , H r   , H J   , F  I   , 2�f�e�f &0 fetchuserdefaults fetchUserDefaults �d m   - .  fullEncoded   �d  �e     I   2 8�c!�b�c &0 fetchuserdefaults fetchUserDefaults! "�a" m   3 4##  demoEncoded   �a  �b    $%$ I   8 >�`&�_�` &0 fetchuserdefaults fetchUserDefaults& '�^' m   9 :((  fullSourceCode   �^  �_  % )�]) I   > D�\*�[�\ &0 fetchuserdefaults fetchUserDefaults* +�Z+ m   ? @,,  demoSourceCode   �Z  �[  �]   o      �Y�Y 0 outputfolders outputFolders + % get folder names from user defaults.    -.- l  I I�X�W�X  �W  . /0/ l  I W121 r   I W343 I   I U�V5�U�V 0 makefolders makeFolders5 676 o   J K�T�T 0 outputfolders outputFolders7 8�S8 I   K Q�R9�Q�R &0 fetchuserdefaults fetchUserDefaults9 :�P: m   L M;;  outputFolderPath   �P  �Q  �S  �U  4 o      �O�O 0 outputfolders outputFolders2 h b create folders and replace outputfolder with a list of records like: {|folderName|:, |fullPath|:}   0 <=< l  X X�N�M�N  �M  = >?> l  X X�L@�L  @ o i	tell application "Finder" to log name of container of POSIX file (|fullPath| of item 1 of outputFolders)   ? ABA l  X X�K�J�K  �J  B CDC X   X�E�IFE l  h�GHG k   h�II JKJ l  h h�H�G�H  �G  K LML I   h s�FN�E�F 0 
showstatus 
showStatusN OPO b   i nQRQ m   i jSS ! Compiling source code for:    R n   j mTUT o   k m�D�D 0 fileName  U o   j k�C�C 0 thefile theFileP V�BV m   n o�A
�A boovtrue�B  �E  M WXW r   t �YZY [   t �[\[ o   t y�@�@ &0 completedprogress completedProgress\ ]   y �]^] m   y |__ ?�      ^ l  | �`�?` ^   | �aba m   | }�>�> b l  } �c�=c I  } ��<d�;
�< .corecnte****       ****d o   } ~�:�: 0 filelist fileList�;  �=  �?  Z o      �9�9 &0 completedprogress completedProgressX efe l  � ��8�7�8  �7  f ghg r   � �iji I   � ��6k�5�6  0 applywatermark applyWatermarkk lml n   � �non o   � ��4�4 0 fullPath  o o   � ��3�3 0 thefile theFilem pqp n   � �rsr o   � ��2�2 0 fullPath  s n   � �tut 4   � ��1v
�1 
cobjv m   � ��0�0 u o   � ��/�/ 0 outputfolders outputFoldersq wxw I   � ��.y�-�. &0 fetchuserdefaults fetchUserDefaultsy z�,z m   � �{{  watermarkMenuString   �,  �-  x |�+| m   � �}}      �+  �5  j o      �*�*  0 fullplugsource fullplugSourceh ~~ l  � ��)�(�)  �(   ��� I   � ��'��&�' 0 
showstatus 
showStatus� ��� b   � ���� m   � ��� &  Compiling demo source code for:    � n   � ���� o   � ��%�% 0 fileName  � o   � ��$�$ 0 thefile theFile� ��#� m   � ��"
�" boovtrue�#  �&  � ��� r   � ���� [   � ���� o   � ��!�! &0 completedprogress completedProgress� ]   � ���� m   � ��� ?�      � l  � ��� � ^   � ���� m   � ��� � l  � ���� I  � ����
� .corecnte****       ****� o   � ��� 0 filelist fileList�  �  �   � o      �� &0 completedprogress completedProgress� ��� l  � ����  �  � ��� r   � ���� I   � �����  0 applywatermark applyWatermark� ��� n   � ���� o   � ��� 0 fullPath  � o   � ��� 0 thefile theFile� ��� n   � ���� o   � ��� 0 fullPath  � n   � ���� 4   � ���
� 
cobj� m   � ��� � o   � ��� 0 outputfolders outputFolders� ��� I   � ����� &0 fetchuserdefaults fetchUserDefaults� ��� m   � ���  watermarkMenuString   �  �  � ��� I   � ����
� &0 fetchuserdefaults fetchUserDefaults� ��	� m   � ���  waterMarkSource   �	  �
  �  �  � o      ��  0 demoplugsource demoplugSource� ��� l  � ����  �  � ��� l  � ����  �  � ��� I   ����� 0 
showstatus 
showStatus� ��� b   � ���� n   � ���� o   � ��� 0 fileName  � o   � �� �  0 thefile theFile� m   � ��� * $: Sending demo code to Final Cut Pro   � ���� m   � ��
�� boovtrue��  �  � ��� r  ��� [  ��� o  
���� &0 completedprogress completedProgress� ]  
��� m  
�� ?�      � l ���� ^  ��� m  ���� � l ���� I �����
�� .corecnte****       ****� o  ���� 0 filelist fileList��  ��  ��  � o      ���� &0 completedprogress completedProgress� ��� l ������  ��  � ��� l ������  ��  � ��� I  @������� 80 fxbuildersaveencodedplugin FXBuilderSaveEncodedPlugin� ��� o  ����  0 demoplugsource demoplugSource� ��� l 4���� c  4��� n  0��� 7 "0����
�� 
ctxt� m  (*���� � m  +/������� n  "��� o   "���� 0 fileName  � o   ���� 0 thefile theFile� m  03��
�� 
TEXT��  � ���� n  4<��� o  8<���� 0 fullPath  � n  48��� 4  58���
�� 
cobj� m  67���� � o  45���� 0 outputfolders outputFolders��  ��  � ��� l AA������  ��  � ��� I  AN������� 0 
showstatus 
showStatus� ��� b  BI��� n  BE��� o  CE���� 0 fileName  � o  BC���� 0 thefile theFile� m  EH�� * $: Sending full code to Final Cut Pro   � ���� m  IJ��
�� boovtrue��  ��  � ��� r  Of��� [  O`��� o  OT���� &0 completedprogress completedProgress� ]  T_��� m  TW   ?�      � l W^�� ^  W^ m  WX����  l X]�� I X]����
�� .corecnte****       **** o  XY���� 0 filelist fileList��  ��  ��  � o      ���� &0 completedprogress completedProgress�  l gg������  ��   	 I  g���
���� 80 fxbuildersaveencodedplugin FXBuilderSaveEncodedPlugin
  o  hi����  0 fullplugsource fullplugSource  l i~�� c  i~ n  iz 7 lz��
�� 
ctxt m  rt����  m  uy������ n  il o  jl���� 0 fileName   o  ij���� 0 thefile theFile m  z}��
�� 
TEXT��   �� n  ~� o  ������ 0 fullPath   n  ~� 4  ���
�� 
cobj m  ������  o  ~���� 0 outputfolders outputFolders��  ��  	  l ��������  ��    ��  l ��������  ��  ��  H "  from 1 to count of fileList   �I 0 thefile theFileF o   [ \���� 0 filelist fileListD !"! l ��������  ��  " #$# l ��������  ��  $ %&% l ����'��  ' + % check for "open on finished checkbox   & ()( O ��*+* I ��������
�� .miscactvnull��� ��� null��  ��  +  f  ��) ,-, I  ����.����  0 revealinfinder revealInFinder. /��/ n  ��010 o  ������ 0 fullPath  1 n  ��232 4  ����4
�� 
cobj4 m  ������ 3 o  ������ 0 outputfolders outputFolders��  ��  - 565 l ��������  ��  6 787 r  ��9:9 l ��;��; \  ��<=< l ��>��> I ��������
�� .misccurdldt    ��� null��  ��  ��  = o  ������ 0 	starttime 	startTime��  : o      ����  0 elapsedseconds elapsedSeconds8 ?@? I ����A��
�� .ascrcmnt****      � ****A b  ��BCB m  ��DD  Time elapsed:    C I  ����E���� 0 secondstohms secondsToHMSE F��F o  ������  0 elapsedseconds elapsedSeconds��  ��  ��  @ GHG I ����I��
�� .ascrcmnt****      � ****I b  ��JKJ b  ��LML m  ��NN  Final Cut Pro crashed:    M o  ������ 0 
crashcount  K m  ��OO   times.   ��  H PQP I  ����R���� 0 
showstatus 
showStatusR STS b  ��UVU b  ��WXW b  ��YZY m  ��[[  Elapsed Time:    Z I  ����\���� 0 secondstohms secondsToHMS\ ]��] o  ������  0 elapsedseconds elapsedSeconds��  ��  X m  ��^^  
 crashes:    V o  ������ 0 
crashcount  T _��_ m  ����
�� boovtrue��  ��  Q `��` l ��������  ��  ��  � aba l     ������  ��  b cdc l     ������  ��  d efe i   < ?ghg I      ��i���� 0 
showstatus 
showStatusi jkj o      ���� 0 
themessage 
theMessagek l��l o      ���� 0 	thestatus 	theStatus��  ��  h k     mm non l     ������  ��  o pqp I    ��r��
�� .ascrcmnt****      � ****r o     ���� 0 
themessage 
theMessage��  q sts r    uvu o    ���� 0 
themessage 
theMessagev n      wxw 1    �
� 
pcntx n    yzy 4    �~{
�~ 
texF{ m    ||  statusMessage   z 4    �}}
�} 
cwin} m   	 
~~ 
 main   t �| L    �� o    �{�{ 0 	thestatus 	theStatus�|  f ��� l     �z�y�z  �y  � ��� i   @ C��� I      �x��w�x 0 makeprogress makeProgress� ��v� o      �u�u 0 progressvalue progressValue�v  �w  � r     ��� o     �t�t 0 progressvalue progressValue� n      ��� 1    
�s
�s 
pcnt� n    ��� 4    �r�
�r 
proI� m    ��  theProgressBar   � 4    �q�
�q 
cwin� m    �� 
 main   � ��� l     �p�o�p  �o  � ��� l     �n�m�n  �m  � ��� l     �l�k�l  �k  � ��� l     �j�i�j  �i  � ��� l     �h�g�h  �g  � ��� i   D G��� I      �f��e�f 0 
istextfile 
isTextFile� ��d� o      �c�c 0 thefile theFile�d  �e  � k     J�� ��� l     �b��b  � z t checks a file for a known extension, a TEXT file type, and a type-id containing "text" returns true on any of those   � ��� l     �a�`�a  �`  � ��� r     
��� I    �_��^
�_ .sysonfo4asfe        file� l    ��]� 4     �\�
�\ 
psxf� o    �[�[ 0 thefile theFile�]  �^  � o      �Z�Z 0 theinfo theInfo� ��� r    ��� n    ��� 1    �Y
�Y 
utid� o    �X�X 0 theinfo theInfo� o      �W�W 0 	thetypeid 	theTypeID� ��� r    ��� n    ��� 1    �V
�V 
asty� o    �U�U 0 theinfo theInfo� o      �T�T 0 thefiletype theFileType� ��� r    ��� n    ��� 1    �S
�S 
nmxt� o    �R�R 0 theinfo theInfo� o      �Q�Q 0 theextension theExtension� ��� l   �P�O�P  �O  � ��� l   �N�M�N  �M  � ��� Z    )���L�K� =    ��� o    �J�J 0 thefiletype theFileType� m    �� 
 TEXT   � L   # %�� m   # $�I
�I boovtrue�L  �K  � ��� l  * *�H�G�H  �G  � ��� Z   * 6���F�E� E   * -��� o   * +�D�D 0 	thetypeid 	theTypeID� m   + ,�� 
 text   � L   0 2�� m   0 1�C
�C boovtrue�F  �E  � ��� l  7 7�B�A�B  �A  � ��� Z   7 G���@�?� E  7 >��� o   7 <�>�>  0 preferredtypes preferredTypes� o   < =�=�= 0 theextension theExtension� L   A C�� m   A B�<
�< boovtrue�@  �?  � ��� l  H H�;�:�;  �:  � ��9� L   H J�� m   H I�8
�8 boovfals�9  � ��� l     �7�6�7  �6  � ��� l     �5�4�5  �4  � ��� i   H K��� I      �3�2�1�3 0 resetfilelist resetFileList�2  �1  � l     �0�/�0  �/  � ��� l     �.�-�.  �-  � ��� i   L O��� I      �,�+�*�, (0 resetoutputfolders resetOutputFolders�+  �*  � k     '�� ��� I    �)��(
�) .ascrcmnt****      � ****� m     ��  resetting Output Folders   �(  � ��� I    �'��&�' "0 setuserdefaults setUserDefaults� ��� m    �� 
 full   � ��%� m    	��  fullEncoded   �%  �&  �    I    �$�#�$ "0 setuserdefaults setUserDefaults  m     
 demo    �" m      demoEncoded   �"  �#   	 I    �!
� �! "0 setuserdefaults setUserDefaults
  m      	full code    � m      fullSourceCode   �  �   	  I    %��� "0 setuserdefaults setUserDefaults  m       	demo code    � m     !  demoSourceCode   �  �   � l  & &��    	return true   �  �  l     ���  �    l     ���  �    l     ���  �    !  l     ���  �  ! "#" l     ���  �  # $%$ l     ���  �  % &'& i   P S()( I      �*�� 0 zeropad zeroPad* +,+ o      �� 0 theval theVal, -�
- o      �	�	 0 	endlength 	endLength�
  �  ) k     (.. /0/ l     �1�  1 4 . endLength is number of total digits to return   0 232 U     454 l   676 s    898 b    :;: m    <<  
0000000000   ; o    �� 0 theval theVal9 o      �� 0 theval theVal7   add 10 zeros at a time   5 [    
=>= l   ?�? c    @A@ ^    BCB o    �� 0 	endlength 	endLengthC m    �� 
A m    �
� 
long�  > m    	�� 3 DED l   � ���   ��  E F��F L    (GG n    'HIH 7   &��JK
�� 
ctxtJ l   "L��L ]    "MNM o     ���� 0 	endlength 	endLengthN m     !��������  K m   # %������I o    ���� 0 theval theVal��  ' OPO l     ������  ��  P QRQ l     ������  ��  R STS l     ������  ��  T UVU i   T WWXW I      ��Y���� 0 
getversion 
getVersionY Z��Z o      ���� 0 thefile theFile��  ��  X I    ��[��
�� .sysoexecTEXT���     TEXT[ b     \]\ b     ^_^ m     `` % cvs -d/usr/local/cvsrep status    _ n    aba 1    ��
�� 
strqb o    ���� 0 thefile theFile] m    cc #  | awk '/Working/ {print $3}'   ��  V ded l     ������  ��  e fgf l     ������  ��  g hih l     ������  ��  i jkj l     ������  ��  k lml i   X [non I      ��p���� 0 makefolders makeFoldersp qrq o      ���� &0 outputfoldernames outputFolderNamesr s��s o      ���� $0 outputfolderpath outputFolderPath��  ��  o k     �tt uvu l     ������  ��  v wxw l      ��y��  y   Create Build folder    x z{z r     |}| I    ������
�� .misccurdldt    ��� null��  ��  } o      ���� 0 buildfolder buildFolder{ ~~ l   ;��� r    ;��� b    9��� b    /��� b    %��� b    #��� b    ��� b    ��� m    	��  build_   � n   	 ��� 1   
 ��
�� 
year� o   	 
���� 0 buildfolder buildFolder� I    ������� 0 zeropad zeroPad� ��� c    ��� n    ��� m    ��
�� 
mnth� o    ���� 0 buildfolder buildFolder� m    ��
�� 
long� ���� m    ���� ��  ��  � I    "������� 0 zeropad zeroPad� ��� n    ��� 1    ��
�� 
day � o    ���� 0 buildfolder buildFolder� ���� m    ���� ��  ��  � m   # $��  _   � I   % .������� 0 zeropad zeroPad� ��� n   & )��� 1   ' )��
�� 
hour� o   & '���� 0 buildfolder buildFolder� ���� m   ) *���� ��  ��  � I   / 8������� 0 zeropad zeroPad� ��� n   0 3��� 1   1 3��
�� 
min � o   0 1���� 0 buildfolder buildFolder� ���� m   3 4���� ��  ��  � o      ���� 0 buildfolder buildFolder�   create build folder name    ��� l  < <������  ��  � ��� r   < @��� J   < >����  � o      ���� 0 outputfolders outputFolders� ��� l  A D��� r   A D��� m   A B��      � o      ���� 0 sh  � "  initialize the shell script   � ��� X   E ������ k   U �� ��� r   U l��� K   U i�� ������ 0 
folderName  � o   V W���� 0 i  � ������� 0 fullPath  � b   X e��� b   X c��� b   X _��� b   X ]��� o   X Y���� $0 outputfolderpath outputFolderPath� m   Y \��  /   � o   ] ^���� 0 buildfolder buildFolder� m   _ b��  /   � o   c d���� 0 i  ��  � n      ���  ;   j k� o   i j���� 0 outputfolders outputFolders� ���� l  m ��� r   m ��� b   m }��� b   m y��� b   m r��� o   m n���� 0 sh  � m   n q��  
mkdir -p "   � n   r x��� o   v x���� 0 fullPath  � n   r v��� 4  s v���
�� 
cobj� m   t u������� o   r s���� 0 outputfolders outputFolders� m   y |�� 	 ";    � o      ���� 0 sh  � 1 + THIS WILL FAIL ON NAMES WITH A DOUBLEQUOTE   ��  �� 0 i  � o   H I���� &0 outputfoldernames outputFolderNames� ��� l  � ���� I  � ������
�� .sysoexecTEXT���     TEXT� o   � ����� 0 sh  ��  �   create the folders   � ��� l  � �������  ��  � ���� L   � ��� o   � ����� 0 outputfolders outputFolders��  m ��� l     ������  ��  � ��� l     ������  ��  � ��� l     ������  ��  � ��� l     ������  ��  � ��� l     ������  ��  � ��� i   \ _��� I      �������  0 applywatermark applyWatermark� ��� o      ���� 0 thefile theFile�    o      ���� 0 	outfolder 	outFolder  o      ���� 0 menumark menuMark �� o      ���� 0 filemark fileMark��  ��  � k     �  l     ������  ��   	 l     ��
��  
 o i the following shell script reads a text file into a variable, adds "menuMark" to the title of the effect   	  l     ����   D > and appends the contents of "fileMark" to the end of the file     l     ����   2 , menuMark is usually something like "[BETA]"     l     ����   [ U fileMark is a file containing code to watermark an effect (should be self-contained)     l     ������  ��    l     ����   P J send a blank or non-existant fileMark to skip over "DEMO"-izing the files     l     ������  ��    l     ����   C = source files are prefixed with version, build name and date	     l     ��~�  �~    !  r     "#" m     �}
�} boovfals# o      �|�| 0 dobeta doBeta! $%$ Q     &'�{& k    (( )*) l   +,+ c    -.- 4    �z/
�z 
psxf/ o   	 
�y�y 0 filemark fileMark. m    �x
�x 
alis, S M check that the watermark file exists. if this fails, it's not a DEMO compile   * 010 l   232 r    454 b    676 m    88  DEMO    7 o    �w�w 0 menumark menuMark5 o      �v�v 0 menumark menuMark3 6 0  update the contents of the menu add-on string    1 9�u9 r    :;: m    �t
�t boovtrue; o      �s�s 0 dobeta doBeta�u  ' R      �r�q�p
�r .ascrerr ****      � ****�q  �p  �{  % <=< l  ! !�o�n�o  �n  = >?> l  ! !�m@�m  @ S M	tell application "Finder" to set thisBuild to name of container of outFolder   ? ABA l  ! !�l�k�l  �k  B CDC l  ! 3EFE r   ! 3GHG n   ! 1IJI 1   / 1�j
�j 
pnamJ l  ! /K�iK I  ! /�hL�g
�h .sysonfo4asfe        fileL 4   ! +�fM
�f 
alisM l  # *N�eN 4   # *�dO
�d 
psxfO l  % (P�cP b   % (QRQ o   % &�b�b 0 	outfolder 	outFolderR m   & 'SS 
 /../   �c  �e  �g  �i  H o      �a�a 0 	thisbuild 	thisBuildF P J back up one level from the output folder to recover the build folder name   D TUT l  4 4�`�_�`  �_  U VWV r   4 FXYX l  4 DZ�^Z b   4 D[\[ b   4 9]^] l  4 7_�]_ c   4 7`a` o   4 5�\�\ 0 	outfolder 	outFoldera m   5 6�[
�[ 
ctxt�]  ^ m   7 8bb  /   \ n   9 Ccdc 1   A C�Z
�Z 
pnamd l  9 Ae�Ye I  9 A�Xf�W
�X .sysonfo4asfe        filef l  9 =g�Vg 4   9 =�Uh
�U 
psxfh o   ; <�T�T 0 thefile theFile�V  �W  �Y  �^  Y o      �S�S 0 outfile outFileW iji l  G G�R�Q�R  �Q  j klk r   G ~mnm b   G |opo b   G xqrq b   G tsts b   G puvu b   G lwxw b   G hyzy b   G f{|{ b   G b}~} b   G `� b   G \��� b   G Z��� b   G X��� b   G R��� b   G P��� b   G N��� b   G L��� m   G H�� * $
	d=`cvs -d/usr/local/cvsrep status    � n   H K��� 1   I K�P
�P 
strq� o   H I�O�O 0 thefile theFile� m   L M�� D > | awk '/Working/ { print "\t//\tVersion: " $3 }'`;
	b="\t//\t   � o   N O�N�N 0 	thisbuild 	thisBuild� m   P Q�� E ?";
	echo -e "$d\n$b\n\t//\t"`date '+%B %d, %Y'` "\n\n" |

	tee    � n   R W��� 1   U W�M
�M 
strq� n   R U��� 1   S U�L
�L 
psxp� o   R S�K�K 0 outfile outFile� m   X Y�� 4 .; 
	
	sed -e 's/\([fF]ilter[\t ]*"[^"]*\)"/\1    � o   Z [�J�J 0 menumark menuMark� m   \ _�� 2 ,"/' -e 's/\([Tt]ransition[\t ]*"[^"]*\)"/\1    ~ o   ` a�I�I 0 menumark menuMark| m   b e�� 1 +"/' -e 's/\([Gg]enerator[\t ]*"[^"]*\)"/\1    z o   f g�H�H 0 menumark menuMarkx m   h k�� 
 "/'    v n   l o��� 1   m o�G
�G 
strq� o   l m�F�F 0 thefile theFilet m   p s��   | 
	tee -a    r n   t w��� 1   u w�E
�E 
strq� o   t u�D�D 0 outfile outFilep m   x {��  ;    n o      �C�C 0 	thescript 	theScriptl ��� l   �B�A�B  �A  � ��� Z    ����@�?� =   ���� o    ��>�> 0 dobeta doBeta� m   � ��=
�= boovtrue� r   � ���� b   � ���� b   � ���� b   � ���� b   � ���� b   � ���� b   � ���� o   � ��<�< 0 	thescript 	theScript� m   � ��� ( "
		echo -e "\n\n\n\n" | 
		tee -a    � n   � ���� 1   � ��;
�; 
strq� o   � ��:�: 0 outfile outFile� m   � ���  ;
		
		cat    � n   � ���� 1   � ��9
�9 
strq� o   � ��8�8 0 filemark fileMark� m   � ���  | 
		tee -a    � n   � ���� 1   � ��7
�7 
strq� o   � ��6�6 0 outfile outFile� o      �5�5 0 	thescript 	theScript�@  �?  � ��� l  � ��4�3�4  �3  � ��� r   � ���� I  � ��2��
�2 .sysoexecTEXT���     TEXT� o   � ��1�1 0 	thescript 	theScript� �0��/
�0 
alen� m   � ��.
�. boovfals�/  � o      �-�- 0 outfiletext outFileText� ��� L   � ��� o   � ��,�, 0 outfiletext outFileText� ��+� l  � ��*�)�*  �)  �+  � ��� l     �(�'�(  �'  � ��� l     �&�%�&  �%  � ��� l     �$�#�$  �#  � ��� i   ` c��� I      �"��!�"  0 revealinfinder revealInFinder� �� � o      �� 0 thepath thePath�   �!  � k     $�� ��� l     ���  � @ : reveals a file in the Finder, takes a POSIX path as input   � ��� l     ���  �  � ��� O     "��� k    !�� ��� I   	���
� .miscactvnull��� ��� null�  �  � ��� I  
 ���
� .aevtodocnull  �    alis� n   
 ��� m    �
� 
ctnr� l  
 ��� c   
 ��� 4   
 ��
� 
psxf� o    �� 0 thepath thePath� m    �
� 
alis�  �  � ��� I   !���
� .miscslctnull���    obj � l   ��� c    ��� 4    ��
� 
psxf� o    �� 0 thepath thePath� m    �
� 
alis�  �  �  � m     ���null     ߀�� B�{
Finder.appined) title of the effectny of thoseemo code"} -- theMACS   alis    �  Joe PowerBook HD 80        ���H+   B�{
Finder.app                                                      B��g~5        ����  	                CoreServices    ��E      �gą     B�{ B�W B�V  :Joe PowerBook HD 80:System:Library:CoreServices:Finder.app   
 F i n d e r . a p p  (  J o e   P o w e r B o o k   H D   8 0  &System/Library/CoreServices/Finder.app  / ��  � ��
� l  # #�	��	  �  �
  � ��� l     ���  �  � ��� l     ���  �  � ��� l     ���  �  � ��� i   d g   I      �� ��� 40 fcpdismissstartupwindows FCPdismissStartupWindows�   ��   k     �  I    ����
�� .ascrcmnt****      � **** m        FCPdismissStartupWindows()   ��    r    	
	 [     o    ���� 0 	loopcount   m    ���� 
 o      ���� 0 	loopcount    l   ����   p j this checks for every startup window I can find, closes one then calls itself again until it returns true     l   ����   ' ! check for window "Offline Files"     l    O    I   ������
�� .miscactvnull��� ��� null��  ��   m    �null     ߀��   Final Cut Pro.apptil it returns true �.6|    ��T   ������` 8KeyG   alis    |  Joe PowerBook HD 80        ���H+     Final Cut Pro.app                                               Oh��        ����  	                Applications    ��E      ��UF         2Joe PowerBook HD 80:Applications:Final Cut Pro.app  $  F i n a l   C u t   P r o . a p p  (  J o e   P o w e r B o o k   H D   8 0  Applications/Final Cut Pro.app  / ��     bring FCP to front     l   ������  ��    O    � O   # � !  k   * �"" #$# l  * *������  ��  $ %&% Q   * �'()' k   - q** +,+ t   - 9-.- k   / 8// 010 r   / 6232 n   / 4454 1   2 4��
�� 
pnam5 2   / 2��
�� 
cwin3 o      ���� 0 
windowlist 
windowList1 6��6 l   7 7��7��  7 � � FCP will occasionally fail to respond to System Events during launch and restoration of exising projects. I've never had a 5 minute wait, but who knows...    ��  . m   - .����,, 898 l  : :������  ��  9 :;: Z   : O<=����< E   : =>?> o   : ;���� 0 
windowlist 
windowList? m   ; <@@  External A/V   = k   @ KAA BCB l  @ EDED l  @ EF��F I  @ E��G��
�� .prcskcodnull���    longG m   @ A���� 5��  ��  E   press escape   C H��H n  F KIJI I   G K�������� 40 fcpdismissstartupwindows FCPdismissStartupWindows��  ��  J  f   F G��  ��  ��  ; KLK l  P P������  ��  L MNM Z   P oOP����O E   P SQRQ o   P Q���� 0 
windowlist 
windowListR m   Q RSS  Offline Files   P k   V kTT UVU I  V e��W��
�� .prcsclicuiel    ��� uielW n   V aXYX 4   Z a��Z
�� 
butTZ m   ] `[[  Continue   Y 4   V Z��\
�� 
cwin\ m   X Y]]  Offline Files   ��  V ^��^ n  f k_`_ I   g k�������� 40 fcpdismissstartupwindows FCPdismissStartupWindows��  ��  `  f   f g��  ��  ��  N a��a l  p p������  ��  ��  ( R      ��bc
�� .ascrerr ****      � ****b l     d��d o      ���� 0 error_message  ��  c ��e��
�� 
errne l     f��f o      ���� 0 error_number  ��  ��  ) k   y �gg hih l  y y��j��  j 1 + i don't think is is ever getting called...   i klk I  y ���m��
�� .ascrcmnt****      � ****m b   y �non b   y �pqp b   y �rsr b   y �tut b   y �vwv b   y �xyx m   y |zz  FAILED on:    y o   | ����� 0 	loopcount  w m   � �{{  ,    u o   � ����� 0 error_number  s m   � �||   (   q o   � ����� 0 error_number  o m   � �}}  ) retrying...   ��  l ~~ l  � �������  ��   ��� l  � ���� Z  � �������� A   � ���� o   � ����� 0 	loopcount  � m   � ����� d� n  � ���� I   � ��������� 40 fcpdismissstartupwindows FCPdismissStartupWindows��  ��  �  f   � ���  ��  � 4 . loopcount is a check to prevent runaway loops   � ���� l  � �������  ��  ��  & ���� l  � �������  ��  ��  ! 4   # '���
�� 
prcs� m   % &��  Final Cut Pro    m     ��null     ߀�� B�{System Events.app 9�0 K r    ��� �� �.6|    ��T   �������` 9sevs   alis    �  Joe PowerBook HD 80        ���H+   B�{System Events.app                                               C&#�c��        ����  	                CoreServices    ��E      �c��     B�{ B�W B�V  AJoe PowerBook HD 80:System:Library:CoreServices:System Events.app   $  S y s t e m   E v e n t s . a p p  (  J o e   P o w e r B o o k   H D   8 0  -System/Library/CoreServices/System Events.app   / ��   ��� L   � ��� m   � ���
�� boovtrue� ���� l  � �������  ��  ��  � ��� l     ������  ��  � ��� l     ������  ��  � ��� l     ������  ��  � ��� l     ������  ��  � ��� i   h k��� I      �������� .0 fxbuilderbringtofront FXBuilderBringToFront��  ��  � l   s��� k    s�� ��� I    �����
�� .ascrcmnt****      � ****� m     ��  FXBuilderBringToFront()   ��  � ��� O    Q��� k   
 P�� ��� I  
 �����
�� .ascrcmnt****      � ****� m   
 ��  *** GETTING PROCESSES ***   ��  � ��� I   �����
�� .ascrcmnt****      � ****� c    ��� n    ��� 1    ��
�� 
pnam� 2    ��
�� 
prcs� m    ��
�� 
list��  � ��� I   *�����
�� .ascrcmnt****      � ****� b    &��� m    ��  FCP EXISTS?    � l   %���� I   %�����
�� .coredoexbool       obj � 4    !���
�� 
prcs� m     ��  Final Cut Pro   ��  ��  ��  � ��� l  + +������  ��  � ���� Z   + P������� H   + 4�� l  + 3���� I  + 3�����
�� .coredoexbool       obj � 4   + /���
�� 
prcs� m   - .��  Final Cut Pro   ��  ��  � k   7 L�� ��� r   7 D��� [   7 >��� o   7 <���� 0 
crashcount  � m   < =���� � o      ���� 0 
crashcount  � ���� n  E L��� I   F L������� 0 
showstatus 
showStatus� ��� m   F G��   FCP Crashed: Restarting...   � ���� m   G H��
�� boovtrue��  ��  �  f   E F��  ��  ��  ��  � m    �� ��� l  R R������  ��  � ��� I   R W��~�}� 40 fcpdismissstartupwindows FCPdismissStartupWindows�~  �}  � ��� l  X X�|�{�|  �{  � ��� O   Xq��� O   \p��� k   co�� ��� r   c j��� n   c h��� 1   f h�z
�z 
pnam� 2   c f�y
�y 
cwin� o      �x�x 0 
windowlist 
windowList� ��� Z   k
���w�v� E   k p��� o   k l�u�u 0 
windowlist 
windowList� m   l o��  	FXBuilder   � k   s�� ��� r   s v��� m   s t�t�t  � o      �s�s 0 fxbcount FXBcount� ��� X   w ���r�� Z  � ����q�p� =  � ���� c   � �	 		  o   � ��o�o 0 	thewindow 	theWindow	 m   � ��n
�n 
TEXT� m   � �		  	FXBuilder   � r   � �			 [   � �			 o   � ��m�m 0 fxbcount FXBcount	 m   � ��l�l 	 o      �k�k 0 fxbcount FXBcount�q  �p  �r 0 	thewindow 	theWindow� o   z {�j�j 0 
windowlist 
windowList� 			 l  � ��i�h�i  �h  	 		�g		 U   �	
		
 k   �		 			 I  � ��f	�e
�f .prcsperfactT       actT	 n   � �			 4   � ��d	
�d 
actT	 m   � �		  AXRaise   	 4   � ��c	
�c 
cwin	 m   � �		  	FXBuilder   �e  	 			 Z   � �		�b�a	 I  � ��`	�_
�` .coredoexbool       obj 	 n   � �			 4   � ��^	
�^ 
scrb	 m   � ��]�] 	 4   � ��\	
�\ 
cwin	 m   � �		  	FXBuilder   �_  	 l  � �	 	!	  L   � �	"	" m   � ��[
�[ boovtrue	! &   end, we found a workable window   �b  �a  	 	#	$	# l  � ��Z�Y�Z  �Y  	$ 	%	&	% Z   � �	'	(�X�W	' =  � �	)	*	) n   � �	+	,	+ 1   � ��V
�V 
ptsz	, 4   � ��U	-
�U 
cwin	- m   � �	.	.  	FXBuilder   	* J   � �	/	/ 	0	1	0 m   � ��T�TB	1 	2�S	2 m   � ��R�R@�S  	( l  � �	3	4	3 I  � ��Q	5	6
�Q .prcskprsnull���    utxt	5 m   � �	7	7  w   	6 �P	8�O
�P 
faal	8 m   � ��N
�N eMdsKcmd�O  	4   close preview window   �X  �W  	& 	9	:	9 l   �M�L�M  �L  	: 	;	<	; l    �K	=�K  	= � � if there's a controls window, do nothing, which is a problem since it will remain frontmost
					this will fail gracefully however and eventually open a new FXBuilder window    	< 	>�J	> l   �I�H�I  �H  �J  	 o   � ��G�G 0 fxbcount FXBcount�g  �w  �v  � 	?	@	? l �F�E�F  �E  	@ 	A	B	A Z  V	C	D�D�C	C = ,	E	F	E n  *	G	H	G 1  &*�B
�B 
valL	H n  &	I	J	I 4  &�A	K
�A 
attr	K m  "%	L	L  	AXEnabled   	J n  	M	N	M 4  �@	O
�@ 
menI	O m  	P	P  	FXBuilder   	N n  	Q	R	Q 4  �?	S
�? 
menE	S m  	T	T  Tools   	R 4  �>	U
�> 
mbar	U m  �=�= 	F m  *+�<
�< boovfals	D k  /R	V	V 	W	X	W I /<�;	Y�:
�; .ascrcmnt****      � ****	Y b  /8	Z	[	Z m  /2	\	\ * $FXBuilder menu disabled. loopcount:    	[ o  27�9�9 0 	loopcount  �:  	X 	]�8	] Z =R	^	_�7�6	^ A  =F	`	a	` o  =B�5�5 0 	loopcount  	a m  BE�4�4 �	_ n IN	b	c	b I  JN�3�2�1�3 40 fcpdismissstartupwindows FCPdismissStartupWindows�2  �1  	c  f  IJ�7  �6  �8  �D  �C  	B 	d�0	d I Wo�/	e�.
�/ .prcsclicuiel    ��� uiel	e n  Wk	f	g	f 4  dk�-	h
�- 
menI	h m  gj	i	i  	FXBuilder   	g n  Wd	j	k	j 4  ]d�,	l
�, 
menE	l m  `c	m	m  Tools   	k 4  W]�+	n
�+ 
mbar	n m  [\�*�* �.  �0  � 4   \ `�)	o
�) 
prcs	o m   ^ _	p	p  Final Cut Pro   � m   X Y�� 	q�(	q l rr�'�&�'  �&  �(  � / ) makes sure frontmost window is FXBuilder   � 	r	s	r l     �%�$�%  �$  	s 	t	u	t l     �#�"�#  �"  	u 	v	w	v i   l o	x	y	x I      �!	z� �! (0 fxbuilderpastetext FXBuilderPasteText	z 	{�	{ o      �� 0 
sourcetext 
sourceText�  �   	y l    ;	|	}	| k     ;	~	~ 		�	 l     ���  �  	� 	�	�	� I     ���� .0 fxbuilderbringtofront FXBuilderBringToFront�  �  	� 	�	�	� I   �	��
� .JonspClpnull���     ****	� c    		�	�	� o    �� 0 
sourcetext 
sourceText	� m    �
� 
ctxt�  	� 	�	�	� l   ���  �  	� 	��	� O    ;	�	�	� O    :	�	�	� k    9	�	� 	�	�	� O   #	�	�	� I   "���
� .miscactvnull��� ��� null�  �  	� m    	� 	�	�	� l  $ +	�	�	� I  $ +�	�	�
� .prcskprsnull���    utxt	� m   $ %	�	�  a   	� �	��
� 
faal	� m   & '�
� eMdsKcmd�  	�   select all   	� 	�	�	� l  , 1	�	�	� I  , 1�
	��	
�
 .prcskcodnull���    long	� m   , -�� 3�	  	� 0 * (delete key) delete current selected text   	� 	��	� l  2 9	�	�	� I  2 9�	�	�
� .prcskprsnull���    utxt	� m   2 3	�	�  va   	� �	��
� 
faal	� m   4 5�
� eMdsKcmd�  	�   paste and select all			   �  	� 4    �	�
� 
prcs	� m    	�	�  Final Cut Pro   	� m    ��  	} 1 + places sourceText into an FXBuilder window   	w 	�	�	� l     �� �  �   	� 	�	�	� l     ������  ��  	� 	�	�	� i   p s	�	�	� I      ��	����� 80 fxbuildersaveencodedplugin FXBuilderSaveEncodedPlugin	� 	�	�	� o      ���� 0 
plugsource 
plugSource	� 	�	�	� o      ���� 0 destname destName	� 	���	� o      ���� 0 
destfolder 
destFolder��  ��  	� k     �	�	� 	�	�	� I    ��	���
�� .ascrcmnt****      � ****	� b     		�	�	� b     	�	�	� b     	�	�	� b     	�	�	� m     	�	� $ FXBuilderSaveEncodedPlugin(x,    	� o    ���� 0 destname destName	� m    	�	�  ,    	� o    ���� 0 
destfolder 
destFolder	� m    	�	�  )   ��  	� 	�	�	� l   ��	���  	� . ( need to have a catch for compile errors   	� 	�	�	� l   ������  ��  	� 	�	�	� l   	�	�	� I    ��	����� (0 fxbuilderpastetext FXBuilderPasteText	� 	���	� o    ���� 0 
plugsource 
plugSource��  ��  	� / ) send source code to the FXBuilder window   	� 	�	�	� l   ������  ��  	� 	�	�	� Q    �	�	�	�	� k    �	�	� 	�	�	� O    �	�	�	� O    �	�	�	� k   # �	�	� 	�	�	� l  # #������  ��  	� 	���	� U   # �	�	�	� l  * �	�	�	� k   * �	�	� 	�	�	� t   * V	�	�	� k   , U	�	� 	�	�	� I  , ?��	���
�� .prcsclicuiel    ��� uiel	� n   , ;	�	�	� 4   6 ;��	�
�� 
menI	� m   7 :	�	�  Create Encoded Plugin...   	� n   , 6	�	�	� 4   3 6��	�
�� 
menE	� m   4 5	�	�  	FXBuilder   	� n   , 3	�	�	� 4   0 3��	�
�� 
mbri	� m   1 2	�	�  	FXBuilder   	� 4   , 0��	�
�� 
mbar	� m   . /���� ��  	� 	���	� r   @ U	�
 	� c   @ S


 n   @ O


 1   K O��
�� 
valL
 n   @ K


 4   F K��

�� 
txtf
 m   I J���� 
 4   @ F��

�� 
cwin
 m   D E���� 
 m   O R��
�� 
ctxt
  o      ���� &0 thesaveextensions theSaveExtensions��  	� m   * +���� 
	� 
	


	 l  W r


 Z  W r

����
 =  W j


 n   W f


 7 X f��


�� 
ctxt
 m   ^ b������
 m   c e������
 o   W X���� &0 thesaveextensions theSaveExtensions
 m   f i

  .fcfcc   
  S   m n��  ��  
 #  clean default name, continue   

 


 l  s s������  ��  
 


 l  s s��
��  
 ] W the existing text did not register correctly, so it probably contained crap characters   
 


 l  s z


 I  s z��
��
�� .prcskcodnull���    long
 m   s v���� 5��  
 "  press escape to cancel save   
 
 
!
  I  { ���
"��
�� .ascrcmnt****      � ****
" m   { ~
#
#  gibberish in save window   ��  
! 
$
%
$ I  � ���
&��
�� .sysodelanull��� ��� nmbr
& m   � ����� ��  
% 
'��
' l  � �������  ��  ��  	� 5 / check for gibberish in the save default box...   	� m   & '���� ��  	� 4     ��
(
�� 
prcs
( m    
)
)  Final Cut Pro   	� m    �	� 
*
+
* l  � �������  ��  
+ 
,
-
, I   � ���
.���� H0 "fxbuildersetsavedialogoutputfolder "FXBuilderSetSaveDialogOutputFolder
. 
/��
/ o   � ����� 0 
destfolder 
destFolder��  ��  
- 
0
1
0 I   � ���
2���� @0 fxbuildersetsavedialogfilename FXBuilderSetSaveDialogFileName
2 
3��
3 o   � ����� 0 destname destName��  ��  
1 
4
5
4 O  � �
6
7
6 I  � ���
8��
�� .prcsclicuiel    ��� uiel
8 n   � �
9
:
9 4   � ���
;
�� 
butT
; m   � �
<
< 
 Save   
: n   � �
=
>
= 4   � ���
?
�� 
cwin
? m   � ����� 
> 4   � ���
@
�� 
prcs
@ m   � �
A
A  Final Cut Pro   ��  
7 m   � ��
5 
B��
B l  � �������  ��  ��  	� R      ��
C
D
�� .ascrerr ****      � ****
C l     
E��
E o      ���� 0 error_message  ��  
D ��
F��
�� 
errn
F l     
G��
G o      ���� 0 error_number  ��  ��  	� k   � �
H
H 
I
J
I I  � ���
K��
�� .ascrcmnt****      � ****
K b   � �
L
M
L b   � �
N
O
N b   � �
P
Q
P m   � �
R
R  Error:    
Q l  � �
S��
S o   � ����� 0 error_number  ��  
O m   � �
T
T  .    
M l  � �
U��
U o   � ����� 0 error_message  ��  ��  
J 
V
W
V l  � �������  ��  
W 
X
Y
X l  � �
Z
[
Z I   � ���
\���� 80 fxbuildersaveencodedplugin FXBuilderSaveEncodedPlugin
\ 
]
^
] o   � ����� 0 
plugsource 
plugSource
^ 
_
`
_ o   � ����� 0 destname destName
` 
a��
a o   � ����� 0 
destfolder 
destFolder��  ��  
[ ) # call self if there's a fatal error   
Y 
b��
b l  � �������  ��  ��  	� 
c��
c l  � �������  ��  ��  	� 
d
e
d l     ������  ��  
e 
f
g
f l     ������  ��  
g 
h
i
h l     ������  ��  
i 
j
k
j i   t w
l
m
l I      ��
n���� @0 fxbuildersetsavedialogfilename FXBuilderSetSaveDialogFileName
n 
o��
o o      ���� 0 thefilename theFileName��  ��  
m k     [
p
p 
q
r
q I    	��
s��
�� .ascrcmnt****      � ****
s b     
t
u
t b     
v
w
v m     
x
x % FXBuilderSetSaveDialogFileName(   
w o    ���� 0 thefilename theFileName
u m    
y
y  )   ��  
r 
z
{
z l  
 
��
|��  
| H B used to simplify entering the outgoing filename when saving files   
{ 
}
~
} l  
 
������  ��  
~ 
��
 O   
 [
�
�
� O    Z
�
�
� O    Y
�
�
� k    X
�
� 
�
�
� I   #��
���
�� .JonspClpnull���     ****
� c    
�
�
� o    ���� 0 thefilename theFileName
� m    �
� 
ctxt��  
� 
�
�
� r   $ '
�
�
� m   $ %�~
�~ boovfals
� o      �}�} 0 checkval checkVal
� 
��|
� V   ( X
�
�
� k   0 S
�
� 
�
�
� O  0 :
�
�
� I  4 9�{�z�y
�{ .miscactvnull��� ��� null�z  �y  
� m   0 1
� 
�
�
� l  ; D
�
�
� I  ; D�x
�
�
�x .prcskprsnull���    utxt
� m   ; <
�
�  av   
� �w
��v
�w 
faal
� J   = @
�
� 
��u
� m   = >�t
�t eMdsKcmd�u  �v  
�   select all, paste   
� 
��s
� r   E S
�
�
� l  E Q
��r
� =  E Q
�
�
� n   E M
�
�
� 1   I M�q
�q 
valL
� 4   E I�p
�
�p 
txtf
� m   G H�o�o 
� c   M P
�
�
� o   M N�n�n 0 thefilename theFileName
� m   N O�m
�m 
ctxt�r  
� o      �l�l 0 checkval checkVal�s  
� =  , /
�
�
� o   , -�k�k 0 checkval checkVal
� m   - .�j
�j boovfals�|  
� 4    �i
�
�i 
cwin
� m    �h�h 
� 4    �g
�
�g 
prcs
� m    
�
�  Final Cut Pro   
� m   
 ���  
k 
�
�
� l     �f�e�f  �e  
� 
�
�
� i   x {
�
�
� I      �d
��c�d H0 "fxbuildersetsavedialogoutputfolder "FXBuilderSetSaveDialogOutputFolder
� 
��b
� o      �a�a 0 thepath thePath�b  �c  
� k     
�
� 
�
�
� I    	�`
��_
�` .ascrcmnt****      � ****
� b     
�
�
� b     
�
�
� m     
�
� ) #FXBuilderSetSaveDialogOutputFolder(   
� o    �^�^ 0 thepath thePath
� m    
�
�  )   �_  
� 
�
�
� l  
 
�]
��]  
� K E used to simplify entering the destination path when saving FXScripts   
� 
�
�
� l  
 
�\�[�\  �[  
� 
��Z
� Z   
 
�
��Y�X
� I   
 �W
��V�W 0 	direxists 	dirExists
� 
��U
� o    �T�T 0 thepath thePath�U  �V  
� O    {
�
�
� O    z
�
�
� O    y
�
�
� k   % x
�
� 
�
�
� I  % ,�S
��R
�S .JonspClpnull���     ****
� c   % (
�
�
� o   % &�Q�Q 0 thepath thePath
� m   & '�P
�P 
ctxt�R  
� 
�
�
� r   - 0
�
�
� m   - .�O
�O boovfals
� o      �N�N 0 checkval checkVal
� 
��M
� V   1 x
�
�
� k   9 s
�
� 
�
�
� O  9 C
�
�
� I  = B�L�K�J
�L .miscactvnull��� ��� null�K  �J  
� m   9 :
� 
�
�
� l  D N
�
�
� I  D N�I
�
�
�I .prcskprsnull���    utxt
� m   D E
�
�  g   
� �H
��G
�H 
faal
� J   F J
�
� 
�
�
� m   F G�F
�F eMdsKcmd
� 
��E
� m   G H�D
�D eMdsKsft�E  �G  
�   Open path entry dialog   
� 
�
�
� l  O Z
�
�
� I  O Z�C
�
�
�C .prcskprsnull���    utxt
� m   O R
�
�  av   
� �B
��A
�B 
faal
� J   S V
�
� 
��@
� m   S T�?
�? eMdsKcmd�@  �A  
�   select all, paste   
� 
�
�
� r   [ k
�
�
� l  [ i �>  =  [ i n   [ e 1   a e�=
�= 
valL 4   [ a�<
�< 
txtf m   _ `�;�;  c   e h o   e f�:�: 0 thepath thePath m   f g�9
�9 
ctxt�>  
� o      �8�8 0 checkval checkVal
� �7 l  l s	
	 I  l s�6�5
�6 .prcskprsnull���    utxt o   l o�4
�4 
ret �5  
   close path entry dialog   �7  
� =  5 8 o   5 6�3�3 0 checkval checkVal m   6 7�2
�2 boovfals�M  
� 4    "�1
�1 
cwin m     !�0�0 
� 4    �/
�/ 
prcs m      Final Cut Pro   
� m    ��Y  �X  �Z  
�  l     �.�-�.  �-    l     �,�+�,  �+    i   |  I      �*�)�* 0 	direxists 	dirExists �( o      �'�' 0 thepath thePath�(  �)   k       l      �&�&   n h a simple and fast test to see if a folder exists, path should be POSIX, doesn't need to end in a slash       Q     !"#! k    $$ %&% I   �%'�$
�% .ascrcmnt****      � ****' l   (�#( I   �")�!
�" .sysoexecTEXT���     TEXT) b    *+* m    ,,  test -d    + n    -.- 1    � 
�  
strq. o    �� 0 thepath thePath�!  �#  �$  & /�/ L    00 m    �
� boovtrue�  " R      ���
� .ascrerr ****      � ****�  �  # L    11 m    �
� boovfals  2�2 l   ���  �  �   343 l     ���  �  4 565 i   � �787 I      �9�� 0 secondstohms secondsToHMS9 :�: o      �� 0 
theseconds 
theSeconds�  �  8 k     �;; <=< l     �>�  > = 7 returns value of seconds in hours, minutes and seconds   = ?@? l     ���  �  @ ABA r     CDC _     EFE o     �� 0 
theseconds 
theSecondsF m    ��D o      �
�
 0 thehours theHoursB GHG r    IJI `    KLK _    	MNM o    �	�	 0 
theseconds 
theSecondsN m    �� <L m   	 
�� <J o      �� 0 
theminutes 
theMinutesH OPO r    QRQ `    STS o    �� 0 
theseconds 
theSecondsT m    �� <R o      �� 0 
theseconds 
theSecondsP UVU l   ���  �  V WXW r    YZY m    [[      Z o      � �  0 	outstring 	outStringX \]\ Z    =^_����^ ?    `a` o    ���� 0 thehours theHoursa m    ����  _ k    9bb cdc r    !efe m    gg      f o      ���� 0 s  d hih Z  " /jk����j >  " %lml o   " #���� 0 thehours theHoursm m   # $���� k r   ( +non m   ( )pp  s    o o      ���� 0 s  ��  ��  i q��q r   0 9rsr b   0 7tut b   0 5vwv b   0 3xyx o   0 1���� 0 	outstring 	outStringy o   1 2���� 0 thehours theHoursw m   3 4zz   hour   u o   5 6���� 0 s  s o      ���� 0 	outstring 	outString��  ��  ��  ] {|{ Z   > c}~����} ?   > A� o   > ?���� 0 
theminutes 
theMinutes� m   ? @����  ~ k   D _�� ��� r   D G��� m   D E��      � o      ���� 0 s  � ��� Z  H U������� >  H K��� o   H I���� 0 
theminutes 
theMinutes� m   I J���� � r   N Q��� m   N O��  s    � o      ���� 0 s  ��  ��  � ���� r   V _��� b   V ]��� b   V [��� b   V Y��� o   V W���� 0 	outstring 	outString� o   W X���� 0 
theminutes 
theMinutes� m   Y Z��   minute   � o   [ \���� 0 s  � o      ���� 0 	outstring 	outString��  ��  ��  | ��� Z   d �������� ?   d g��� o   d e���� 0 
theseconds 
theSeconds� m   e f����  � k   j ��� ��� r   j m��� m   j k��      � o      ���� 0 s  � ��� Z  n {������� >  n q��� o   n o���� 0 
theseconds 
theSeconds� m   o p���� � r   t w��� m   t u��  s   � o      ���� 0 s  ��  ��  � ���� r   | ���� b   | ���� b   | ���� b   | ���� b   | ��� o   | }���� 0 	outstring 	outString� o   } ~���� 0 
theseconds 
theSeconds� m    ���   second   � o   � ����� 0 s  � m   � ���  .   � o      ���� 0 	outstring 	outString��  ��  ��  � ���� L   � ��� o   � ����� 0 	outstring 	outString��  6 ��� l     ������  ��  � ��� l     ������  ��  � ���� j   � ������ 60 asdscriptuniqueidentifier ASDScriptUniqueIdentifier� m   � ��� ) #Joe's FXScript Compiler.applescript   ��       &�����������������������������������������������  � $��������������������������������������������������������������������������  0 preferredtypes preferredTypes�� 0 maxprogress maxProgress�� &0 completedprogress completedProgress�� 0 	loopcount  �� 0 
crashcount  �� 0 	starttime 	startTime�� 0 panelwindow panelWIndow
�� .appSwiFLnull���    obj 
�� .appSawFNnull���    obj 
�� .drADdroRnull���    obj 
�� .coVScliInull���    obj �� 0 dopausepanel doPausePanel
�� .panSpanEnull���    obj �� &0 fetchuserdefaults fetchUserDefaults�� "0 setuserdefaults setUserDefaults�� 0 	docompile 	doCompile�� 0 
showstatus 
showStatus�� 0 makeprogress makeProgress�� 0 
istextfile 
isTextFile�� 0 resetfilelist resetFileList�� (0 resetoutputfolders resetOutputFolders�� 0 zeropad zeroPad�� 0 
getversion 
getVersion�� 0 makefolders makeFolders��  0 applywatermark applyWatermark��  0 revealinfinder revealInFinder�� 40 fcpdismissstartupwindows FCPdismissStartupWindows�� .0 fxbuilderbringtofront FXBuilderBringToFront�� (0 fxbuilderpastetext FXBuilderPasteText�� 80 fxbuildersaveencodedplugin FXBuilderSaveEncodedPlugin�� @0 fxbuildersetsavedialogfilename FXBuilderSetSaveDialogFileName�� H0 "fxbuildersetsavedialogoutputfolder "FXBuilderSetSaveDialogOutputFolder�� 0 	direxists 	dirExists�� 0 secondstohms secondsToHMS�� 60 asdscriptuniqueidentifier ASDScriptUniqueIdentifier
�� .aevtoappnull  �   � ****� ����� �   # %�� d��  ��  ��  
�� 
msng
�� 
msng� �� V��������
�� .appSwiFLnull���    obj �� 0 	theobject 	theObject��  � ������ 0 	theobject 	theObject�� 0 filelist fileList� "�� e n u�� {�������������� ��� ������� � � � � � � � (*?A�� 0 fullPath  
�� 
witP
�� .appScalMnull���    obj 
�� 
kocl
�� 
defE
�� 
insh
�� 
useD
�� 
prdt
�� 
pnam
�� 
pcnt�� �� 
�� .corecrel****      � null��+jvE�O��l�6FO��l�6FO���lvl O*���*�,�-6�����a a  O*���*�,�-6��a �a a a  O*���*�,�-6��a �a a a  O*���*�,�-6��a �a a a  O*���*�,�-6��a �jva a  O*���*�,�-6��a �a a a  O*���*�,�-6��a �a a a  O*���*�,�-6��a �a a a  O*���*�,�-6��a  �a !a a  OP� ��N��������
�� .appSawFNnull���    obj �� 0 	theobject 	theObject��  � ���� 0 	theobject 	theObject� ��[��ce��p~����
�� 
pnam
�� 
draT
�� .appSregInull���    obj 
�� .ascrcmnt****      � ****�� I��,�  � *���lvl UY hO��,�  � *��kvl UY hO��,�  
�j 
Y h� ����������
�� .drADdroRnull���    obj �� 0 	theobject 	theObject�� �~�}�|
�~ 
draI�} 0 draginfo dragInfo�|  � �{�z�y�x�w�v�u�{ 0 	theobject 	theObject�z 0 draginfo dragInfo�y 0 	datatypes 	dataTypes�x 0 thefiles theFiles�w 0 filelist fileList�v 0 theitem theItem�u 0 thetext theText� "�t�s��r�q���p�o�n��m�l�k�j�i�h�g�f�e�d=�cE�b�ad�`�_{�
�t 
pasE
�s 
typP
�r 
preQ
�q 
pnam
�p 
pcnt
�o 
useD
�n 
defE
�m 
list
�l 
kocl
�k 
cobj
�j .corecnte****       ****�i 0 fullPath  �h 0 fileName  
�g 
psxf
�f .sysonfo4asfe        file�e 
�d .ascrcmnt****      � ****�c 0 
showstatus 
showStatus�b 0 
istextfile 
isTextFile
�a 
ctxt
�` 
strq
�_ .sysoexecTEXT���     TEXT���,�,E�O��,�,FO��,�  f�� \jvE�O��,�,E�O*�,��/�,�&E�O ,�[��l kh �a *a �/j �,a �6F[OY��O�*�,�a /�,FOeY hY hO��,a   ��a  }��,�,E�O�j j O�j k *a fl+ Y *a el+ OPO*��k/k+  8��k/a &j Oa ��k/a ,a &%j E�O�*�,�a  /�,FOeY hY hY hOa !��,�,FOf� �^��]�\���[
�^ .coVScliInull���    obj �] 0 	theobject 	theObject�\  � �Z�Y�X�W�Z 0 	theobject 	theObject�Y 0 thefiles theFiles�X 0 thetext theText�W 0 	thefolder 	theFolder� 3��V�U�T��S�R�Q�P��O�N��M������L�K�J�I�H�G�F��E��D�C�B!�A,7�@�?A�>�=L�<W�;b�:�9�8
�V 
pnam
�U 
ctxt
�T .ascrcmnt****      � ****
�S 
opeP
�R 
caCF
�Q 
alMT
�P 
in D�O &0 fetchuserdefaults fetchUserDefaults
�N 
wiFN
�M 
foFT�L �K 
�J .panSdisPnull���    obj 
�I 
rslt
�H 
filO
�G 
list
�F 
dirC�E "0 setuserdefaults setUserDefaults
�D 
cobj
�C 
strq
�B .sysoexecTEXT���     TEXT
�A .sysostflalis    ��� null
�@ 
useD
�? 
defE
�> 
pcnt�= 0 	docompile 	doCompile�< (0 resetoutputfolders resetOutputFolders�; 0 dopausepanel doPausePanel
�: 
cwin
�9 
witS
�8 .panScloPnull���    obj �[L��,%�&j O��,�  �*�, e*�,FOe*�,FUO*�,�*�k+ 
�����a a a a va  O_ k  h*�,a ,a &j O**�,a ,a l+ O*�,a ,a &E�O�j Oa �a k/a ,�&%j E�O*�a k/a  l+ O*�a !l+ Y hY hO��,a "  *j #E�O*�a $l+ Y hO��,a %  **a &,a 'a (/a ),a &k+ *Y hO��,a +  
*j+ ,Y hO��,a -  
*j+ .Y hO��,a /  �a 0,a 1kl 2Y hOP� �7o�6�5���4�7 0 dopausepanel doPausePanel�6  �5  �  � �3�2�1��0�/��.��-�,
�3 
msng
�2 .appSloaNnull���    obj 
�1 
cwin�0 
0 paused  
�/ 
attT
�. .panSdisQnull���    obj 
�- .ascrcmnt****      � ****
�, .sysodelanull��� ��� nmbr�4 Mb  �  �j O*��/Ec  Y hOeE�Ob  �*��/l O h�e �j 
Okj [OY��OP� �+��*�)���(
�+ .panSpanEnull���    obj �* 0 	theobject 	theObject�) �'�&�%
�' 
witS�& 0 
withresult 
withResult�%  � �$�#�$ 0 	theobject 	theObject�# 0 
withresult 
withResult� �"�!
�" .ascrcmnt****      � ****�! 
0 paused  �( 
�j  OfE�� � �������  &0 fetchuserdefaults fetchUserDefaults� ��� �  �� 0 thekey theKey�  � �� 0 thekey theKey� ���
� 
useD
� 
defE
� 
pcnt� *�,�/�,E� �������� "0 setuserdefaults setUserDefaults� ��� �  ��� 0 thevalue theValue� 0 thekey theKey�  � ��� 0 thevalue theValue� 0 thekey theKey� ���
� 
useD
� 
defE
� 
pcnt� �*�,�/�,F� �
��	�����
 0 	docompile 	doCompile�	 ��� �  �� 0 filelist fileList�  � ����� ��� 0 filelist fileList� 0 outputfolders outputFolders� 0 thefile theFile�  0 fullplugsource fullplugSource�   0 demoplugsource demoplugSource��  0 elapsedseconds elapsedSeconds� '������#(,��;��������S��_��{}�������������������D����NO[^
�� .misccurdldt    ��� null�� 0 
showstatus 
showStatus�� &0 fetchuserdefaults fetchUserDefaults�� �� 0 makefolders makeFolders
�� 
kocl
�� 
cobj
�� .corecnte****       ****�� 0 fileName  �� 0 fullPath  ��  0 applywatermark applyWatermark
�� 
ctxt����
�� 
TEXT�� 80 fxbuildersaveencodedplugin FXBuilderSaveEncodedPlugin
�� .miscactvnull��� ��� null��  0 revealinfinder revealInFinder�� 0 secondstohms secondsToHMS
�� .ascrcmnt****      � ****��jEc  OjEc  OjEc  O*j  Ec  O*�el+ O*�k+ *�k+ *�k+ *�k+ �vE�O*�*�k+ l+ 
E�O8�[��l kh *��,%el+ Ob  a k�j ! Ec  O*�a ,��m/a ,*a k+ a �+ E�O*a ��,%el+ Ob  a k�j ! Ec  O*�a ,���/a ,*a k+ *a k+ �+ E�O*��,a %el+ Ob  a k�j ! Ec  O*���,[a \[Zk\Za 2a &��l/a ,m+ O*��,a %el+ Ob  a k�j ! Ec  O*���,[a \[Zk\Za 2a &��k/a ,m+ OP[OY��O) *j UO*��k/a ,k+ O*j  b  E�Oa  *�k+ !%j "Oa #b  %a $%j "O*a %*�k+ !%a &%b  %el+ OP� ��h���������� 0 
showstatus 
showStatus�� ����� �  ������ 0 
themessage 
theMessage�� 0 	thestatus 	theStatus��  � ������ 0 
themessage 
theMessage�� 0 	thestatus 	theStatus� ����~��|��
�� .ascrcmnt****      � ****
�� 
cwin
�� 
texF
�� 
pcnt�� �j  O�*��/��/�,FO�� ������������� 0 makeprogress makeProgress�� ����� �  ���� 0 progressvalue progressValue��  � ���� 0 progressvalue progressValue� ��������
�� 
cwin
�� 
proI
�� 
pcnt�� �*��/��/�,F� �������� ���� 0 
istextfile 
isTextFile�� ����   ���� 0 thefile theFile��  � ������������ 0 thefile theFile�� 0 theinfo theInfo�� 0 	thetypeid 	theTypeID�� 0 thefiletype theFileType�� 0 theextension theExtension  ������������
�� 
psxf
�� .sysonfo4asfe        file
�� 
utid
�� 
asty
�� 
nmxt�� K*�/j E�O��,E�O��,E�O��,E�O��  eY hO�� eY hOb   � eY hOf� ����������� 0 resetfilelist resetFileList��  ��      �� h� ����������� (0 resetoutputfolders resetOutputFolders��  ��     �������
�� .ascrcmnt****      � ****�� "0 setuserdefaults setUserDefaults�� (�j O*��l+ O*��l+ O*��l+ O*��l+ OP� ��)�������� 0 zeropad zeroPad�� ����   ������ 0 theval theVal�� 0 	endlength 	endLength��   ������ 0 theval theVal�� 0 	endlength 	endLength ����<���� 

�� 
long
�� 
ctxt�� ) ��!�&kkh�%EQ�[OY��O�[�\[Z�i \Zi2E� ��X����	
���� 0 
getversion 
getVersion�� ����   ���� 0 thefile theFile��  	 ���� 0 thefile theFile
 `��c��
�� 
strq
�� .sysoexecTEXT���     TEXT�� ��,%�%j � ��o�������� 0 makefolders makeFolders�� ����   ������ &0 outputfoldernames outputFolderNames�� $0 outputfolderpath outputFolderPath��   �������������� &0 outputfoldernames outputFolderNames�� $0 outputfolderpath outputFolderPath�� 0 buildfolder buildFolder�� 0 outputfolders outputFolders�� 0 sh  �� 0 i   �������������������������������������
�� .misccurdldt    ��� null
�� 
year
�� 
mnth
�� 
long�� 0 zeropad zeroPad
�� 
day 
�� 
hour
�� 
min 
�� 
kocl
�� 
cobj
�� .corecnte****       ****�� 0 
folderName  �� 0 fullPath  �� 
�� .sysoexecTEXT���     TEXT�� �*j  E�O��,%*��,�&ll+ %*��,ll+ %�%*��,ll+ %*��,ll+ %E�OjvE�O�E�O >�[��l kh ��a %�%a %�%a �6FO�a %��i/�,%a %E�[OY��O�j O�� �����������  0 applywatermark applyWatermark�� ����   ���������� 0 thefile theFile�� 0 	outfolder 	outFolder�� 0 menumark menuMark�� 0 filemark fileMark��   	����~�}�|�{�z�y�x�� 0 thefile theFile� 0 	outfolder 	outFolder�~ 0 menumark menuMark�} 0 filemark fileMark�| 0 dobeta doBeta�{ 0 	thisbuild 	thisBuild�z 0 outfile outFile�y 0 	thescript 	theScript�x 0 outfiletext outFileText �w�v8�u�tS�s�r�qb��p���o����������n�m
�w 
psxf
�v 
alis�u  �t  
�s .sysonfo4asfe        file
�r 
pnam
�q 
ctxt
�p 
strq
�o 
psxp
�n 
alen
�m .sysoexecTEXT���     TEXT�� �fE�O *�/�&O�%E�OeE�W X  hO*�*��%/E/j �,E�O��&�%*�/j �,%E�O��,%�%�%�%��,�,%�%�%a %�%a %�%a %��,%a %��,%a %E�O�e   �a %��,%a %��,%a %��,%E�Y hO�a fl E�O�OP� �l��k�j�i�l  0 revealinfinder revealInFinder�k �h�h   �g�g 0 thepath thePath�j   �f�f 0 thepath thePath ��e�d�c�b�a�`
�e .miscactvnull��� ��� null
�d 
psxf
�c 
alis
�b 
ctnr
�a .aevtodocnull  �    alis
�` .miscslctnull���    obj �i %� *j O*�/�&�,j O*�/�&j UOP� �_�^�]�\�_ 40 fcpdismissstartupwindows FCPdismissStartupWindows�^  �]   �[�Z�Y�[ 0 
windowlist 
windowList�Z 0 error_message  �Y 0 error_number   �X�W��V��U�T�S@�R�Q�PS]�O[�N�Mz{|}�L
�X .ascrcmnt****      � ****
�W .miscactvnull��� ��� null
�V 
prcs�U,
�T 
cwin
�S 
pnam�R 5
�Q .prcskcodnull���    long�P 40 fcpdismissstartupwindows FCPdismissStartupWindows
�O 
butT
�N .prcsclicuiel    ��� uiel�M 0 error_message   �K�J�I
�K 
errn�J 0 error_number  �I  �L d�\ ��j Ob  kEc  O� *j UO� �*��/ � I�n*�-�,E�OPoO�� �j O)j+ Y hO�� *��/a a /j O)j+ Y hOPW <X  a b  %a %�%a %�%a %j Ob  a  
)j+ Y hOPOPUUOeOP� �H��G�F�E�H .0 fxbuilderbringtofront FXBuilderBringToFront�G  �F   �D�C�B�D 0 
windowlist 
windowList�C 0 fxbcount FXBcount�B 0 	thewindow 	theWindow 1��A���@�?�>���=���<�;	p�:��9�8�7�6		�5	�4	�3	.�2�1�0	7�/�.�-�,�+	T�*	P�)	L�(	\�'	m	i�&
�A .ascrcmnt****      � ****
�@ 
prcs
�? 
pnam
�> 
list
�= .coredoexbool       obj �< 0 
showstatus 
showStatus�; 40 fcpdismissstartupwindows FCPdismissStartupWindows
�: 
cwin
�9 
kocl
�8 
cobj
�7 .corecnte****       ****
�6 
TEXT
�5 
actT
�4 .prcsperfactT       actT
�3 
scrb
�2 
ptsz�1B�0@
�/ 
faal
�. eMdsKcmd
�- .prcskprsnull���    utxt
�, 
mbar
�+ 
menE
�* 
menI
�) 
attr
�( 
valL�' �
�& .prcsclicuiel    ��� uiel�Et�j O� H�j O*�-�,�&j O�*��/j 	%j O*��/j 	 b  kEc  O)�el+ Y hUO*j+ O�*��/*�-�,E�O�a  �jE�O -�[a a l kh �a &a   
�kE�Y h[OY��O _�kh*�a /a a /j O*�a /a k/j 	 eY hO*�a /a ,a a lv  a  a !a "l #Y hOP[OY��Y hO*a $k/a %a &/a 'a (/a )a */a +,f  (a ,b  %j Ob  a - 
)j+ Y hY hO*a $k/a %a ./a 'a //j 0UUOP� �%	y�$�#�"�% (0 fxbuilderpastetext FXBuilderPasteText�$ �!�!   � �  0 
sourcetext 
sourceText�#   �� 0 
sourcetext 
sourceText �����	��	������	�� .0 fxbuilderbringtofront FXBuilderBringToFront
� 
ctxt
� .JonspClpnull���     ****
� 
prcs
� .miscactvnull��� ��� null
� 
faal
� eMdsKcmd
� .prcskprsnull���    utxt� 3
� .prcskcodnull���    long�" <*j+  O��&j O� **��/ "� *j UO���l O�j O���l UU� �	����� 80 fxbuildersaveencodedplugin FXBuilderSaveEncodedPlugin� ��   ���� 0 
plugsource 
plugSource� 0 destname destName� 0 
destfolder 
destFolder�   ���
�	��� 0 
plugsource 
plugSource� 0 destname destName�
 0 
destfolder 
destFolder�	 &0 thesaveextensions theSaveExtensions� 0 error_message  � 0 error_number   &	�	�	�����
)���� 	���	���	�������������
����
#������
A��
<�� 
R
T��
� .ascrcmnt****      � ****� (0 fxbuilderpastetext FXBuilderPasteText
� 
prcs� � 

� 
mbar
�  
mbri
�� 
menE
�� 
menI
�� .prcsclicuiel    ��� uiel
�� 
cwin
�� 
txtf
�� 
valL
�� 
ctxt������ 5
�� .prcskcodnull���    long
�� .sysodelanull��� ��� nmbr�� H0 "fxbuildersetsavedialogoutputfolder "FXBuilderSetSaveDialogOutputFolder�� @0 fxbuildersetsavedialogfilename FXBuilderSetSaveDialogFileName
�� 
butT�� 0 error_message    ������
�� 
errn�� 0 error_number  ��  �� 80 fxbuildersaveencodedplugin FXBuilderSaveEncodedPlugin� ��%�%�%�%j O*�k+ O �� v*��/ n k�kh�n*�k/��/��/�a /j O*a k/a k/a ,a &E�oO�[a \[Za \Zi2a   Y hOa j Oa j Okj OP[OY��UUO*�k+ O*�k+ O� *�a /a k/a a  /j UOPW !X ! "a #�%a $%�%j O*���m+ %OPOP� ��
m����!"���� @0 fxbuildersetsavedialogfilename FXBuilderSetSaveDialogFileName�� ��#�� #  ���� 0 thefilename theFileName��  ! ������ 0 thefilename theFileName�� 0 checkval checkVal" 
x
y�����
���������
�����������
�� .ascrcmnt****      � ****
�� 
prcs
�� 
cwin
�� 
ctxt
�� .JonspClpnull���     ****
�� .miscactvnull��� ��� null
�� 
faal
�� eMdsKcmd
�� .prcskprsnull���    utxt
�� 
txtf
�� 
valL�� \�%�%j O� N*��/ F*�k/ >��&j OfE�O /h�f � *j 
UO���kvl O*�k/a ,��& E�[OY��UUU� ��
�����$%���� H0 "fxbuildersetsavedialogoutputfolder "FXBuilderSetSaveDialogOutputFolder�� ��&�� &  ���� 0 thepath thePath��  $ ������ 0 thepath thePath�� 0 checkval checkVal% 
�
����������������
���������
�������
�� .ascrcmnt****      � ****�� 0 	direxists 	dirExists
�� 
prcs
�� 
cwin
�� 
ctxt
�� .JonspClpnull���     ****
�� .miscactvnull��� ��� null
�� 
faal
�� eMdsKcmd
�� eMdsKsft
�� .prcskprsnull���    utxt
�� 
txtf
�� 
valL
�� 
ret �� ��%�%j O*�k+  m� e*��/ ]*�k/ U��&j 	OfE�O Fh�f � *j UO����lvl Oa ��kvl O*a k/a ,��& E�O_ j [OY��UUUY h� ������'(���� 0 	direxists 	dirExists�� ��)�� )  ���� 0 thepath thePath��  ' ���� 0 thepath thePath( ,����������
�� 
strq
�� .sysoexecTEXT���     TEXT
�� .ascrcmnt****      � ****��  ��  ��   ��,%j j OeW 	X  fOP� ��8����*+���� 0 secondstohms secondsToHMS�� ��,�� ,  ���� 0 
theseconds 
theSeconds��  * ������������ 0 
theseconds 
theSeconds�� 0 thehours theHours�� 0 
theminutes 
theMinutes�� 0 	outstring 	outString�� 0 s  + ����[gpz����������� <�� ���"E�O��"�#E�O��#E�O�E�O�j  �E�O�k �E�Y hO��%�%�%E�Y hO�j  �E�O�k �E�Y hO��%�%�%E�Y hO�j "�E�O�k �E�Y hO��%�%�%�%E�Y hO�� ��-����./��
�� .aevtoappnull  �   � ****- k     00  A����  ��  ��  .  / ���� 
0 paused  �� fE� ascr  ��ޭ
   M S B A M L   `   `   `  ����  FLibrary#    FLibrary.View.Borrow.BorrowUC   5      W SPresentationCore, Version=6.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=6.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=6.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=6.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5      R NSystem.Xaml, Version=6.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5      @d2http://schemas.microsoft.com/expression/blend/2008     5      c _System.Windows.Interactivity, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35Bi:http://schemas.microsoft.com/expression/2010/interactivity  5      _ [MaterialDesignThemes.Wpf, Version=4.3.0.3, Culture=neutral, PublicKeyToken=df2a72020bd7962aFmaterialDesign1http://materialdesigninxaml.net/winfx/xaml/themes  5         MaterialDesignBody#���   5      $��Regular"�5	      &   System.Windows.Media.TextOptions    TextFormattingMode$  Ideal=�5
         TextRenderingMode$
 Auto=�5        MaterialDesignFont#���  5        BorrowVM � DataContext# �  5       � 	Resources 5        Stl_btn_addnew �� 
TargetType # MaterialDesignFlatLightBgButton �� BasedOn �� Property �� Value �� Orientation'  !MaterialDesignThemes.Wpf.PackIcon	   Kind  Stl_btn_export  Stl_btn_edit  MaterialDesignFlatButton  Stl_btn_delete 	 Stl_btn_return��%I  &	       7  &	 �    7  &	 M    7  &	 �    7  &		 f    7  �� 5   
   " ��6'   8   .�5      ��  � ��$ Stretch=�6;   �� 5       � �� �#2c7be56+   �� 5       � �� �#2c7be56,   �� 5       � ��
 �����6+   �� 5       � ��$ 0 0 15 0q�6'   �� 5       � �� 5      �� 5      $ 
Horizontal=�6!   .+�5        $
	 Plus=�62   �� 5      $��10 0 0 0q�6$   $��ADD NEW��66   5      5      5      �� 5    
   " ��6'   8   .�5!      ��  � ��$ Stretch=�6;   �� 5"       � �� �#2c7be56+   �� 5#       � �� �#2c7be56,   �� 5$       � ��
 �����6+   �� 5%       � ��$ 0 0 15 0q�6'   �� 5&       � �� 5'      �� 5(      $ 
Horizontal=�6!   .+�5)        $	 Download=�62   �� 5*      $��10 0 0 0q�6$   $��EXPORT��66   5+      5-      5.      �� 5/   
   " ��6%   8   .�50      ��  � �� �#34364F6+   �� 51       � ��$ 5 0 5 0q�6(   52      �� 53   
   " ��6'   8   .�54      ��  � ��
 � E��6+   �� 55       � ��$ 5 0 5 0q�6(   �� 56       � ��$	 5 0q�6'   57      �� 58   
   " ��6'   8   .�59      ��  � ��
 ��  �6+   �� 5:       � ��$ 5 0 5 0q�6(   �� 5;       � ��$	 5 0q�6'   5<      5=      .��5>      � $��10q�6   
 � RowDefinitions
 5?   
   �� 5@      $	��.1* �6   �� 5A      $��* �6   �� 5B      $
��Auto �6   .+�5E   
   � $��0��6    � ColumnDefinitions 5F      �� 5G      $
��Auto �6#   �� 5H      $��* �6#   �� 5I      $
��Auto �6#   �� 5J      $
��Auto �6#   .+�5M      �� $��0��6   $��Borrow��6(   $��Center=�66   $��10q�6Q   $��18(�6]   
�������$��SemiBold"�6~   �� 5N      $��2��6   #��[ 6%   ��6M   �� *AddNewBorrowCMD+�� 5O      $��3��6   #��[ 6%   ��6M   �� *	ExportCMD+�� 5Q      $��1��6   
�������$	��0.3q�68   $��
15 10 5 10q�6N   $	��397��6b   $	��397��6q   $
��Left=�6�    �� CornerRadius$ 3��6�   ._�5R      �  5S       
 PrimaryHueMidBrush �� Color��%/   &	
       �� 5T      $ Transparent��6E   5U       5V      �� 5W      $	��.2* �6+   �� 5X      $��* �6+   .+�5Z      �� $
��Auto��6   $
��Auto��6*   #��[ 68   
���������6j   0  *MaterialDesignThemes.Wpf.PackIconExtension     Kind$ Search=�   Size 196�   �� 5[      $��1��6   $	��5 0q�6.    �� 
CaretBrush
 �����$��Center=�6�   $��16(�6�   
�������)  #MaterialDesignThemes.Wpf.HintAssist   Hint$ Search��6�   
������ ��6<   �� *ContentSearch+ �� Mode$ TwoWay=� �� UpdateSourceTrigger$ PropertyChanged=�.��6#  .  (System.Windows.Interactivity.Interaction   Triggers 5\      /  )System.Windows.Interactivity.EventTrigger  5]         	EventName$ TextChanged��6-   .  (System.Windows.Interactivity.TriggerBase   Actions. 5^   "   6  0System.Windows.Interactivity.InvokeCommandAction     Command 68   �� *SearchBorrowCMD+5_      .��5`   2   5a      5b      5c      5d      �� 5g   
   $��1��6   ._�5h      �� ��6   �� *	Borrows+��5i      �� 5j      " ��6     MaterialDesignGridViewItem# [ 66   .�5k      ��  � ��$ Center=�6G   �� 5l       � ��$ Center=�6E   �� 5m       � ��$ 15(�65   �� 5n       � ��$ 0q�64    �� Triggers 5o      P� 5p       P� Property �@��
IsSelected P� Value$
 true��6<   . �5q   "   ��  � �� �#041C326?   �� 5r   "    � �� �#041C326?   5s      5u       �� View 5w      �� 5x      .P�5z      �� ��5{      �� 5|   "   $��	Borrow ID��6,   
�������$��SemiBold"�6P   $��10 0 0 0q�6f    �� CellTemplate 5~      �� 5   "   .R�5�   &   ��  ��Name$ id��60   ���#9a9cab��6<   �� *Id+6P   5�   #   5�      �� 5�      ��5�      �� 5�   "   $��Member Name��6,   
�������$��SemiBold"�6R   $��10 0 0 0q�6h    5�      �� 5�   "   .R�5�   &   �� $ member_name��60   ���#9a9cab��6E   �� *
MemberName+6a   5�   #   5�      �� 5�      ��5�      �� 5�   "   $��	Book Name��6,   
�������$��SemiBold"�6P   $��10 0 0 0q�6f    5�      �� 5�   "   .R�5�   &   �� $ 	book_name��60   ���#9a9cab��6C   �� *
BookName+6]   5�   #   5�      �� 5�      ��5�      �� 5�   "   $��Borrow Date��6,   
�������$��SemiBold"�6R   $��10 0 0 0q�6h    5�      �� 5�   "   .R�5�   &   �� $ borrow_date��60   ���#9a9cab��6E   �� *
BorrowDate+ �� StringFormat$ 
dd-MM-yyyy��6|   5�   #   5�      �� 5�      ��5�      �� 5�   "   $��Due Date��6,   
�������$��SemiBold"�6O   $��10 0 0 0q�6e    5�      �� 5�   "   .R�5�   &   �� $ due_date��60   ���#9a9cab��6B   �� *	DueDate+$ 
dd-MM-yyyy��6v   5�   #   5�      �� 5�      ��5�      �� 5�   "   $��Total��6,   
�������$��SemiBold"�6L   $��10 0 0 0q�6b    5�      �� 5�   "   .R�5�   &   �� $ total��60   ���#9a9cab��6?   �� *Total+6V   5�   #   5�      �� 5�      ��5�      �� 5�   "   $��Action��6,   
�������$��SemiBold"�6M   $��10 0 0 0q�6c    5�      �� 5�   "   .R�5�   &   �� $ 
Horizontal=�61   .+�5�   *   �� #��[ 61   ��6W   ��  �� RelativeSource ��   �� AncestorType  ListView! �� Path$! DataContext.EditBorrowCMD���6�   �� .��5�   .     $
	 Edit=�6F   $��19��6R   $��19��6]   ���#ECB3656i   5�   +   �� 5�   *   #��[ 61   $��0��6Y   ��6g   ��  ��   ListView$!! DataContext.DeleteBorrowCMD���6�   �� .��5�   .     $	 Delete=�6F   $��19��6T   $��19��6_   5�   +   �� 5�   *   #��[	 61   $��0��6Y   ��6g   ��  ��   ListView$!! DataContext.ReturnBorrowCMD���6�   �� .��5�   .     $	 ArrowUp=�6F   $��19��6U   $��19��6`   5�   +   5�   '   5�   #   5�      5�      5�      5�      5�      5�      
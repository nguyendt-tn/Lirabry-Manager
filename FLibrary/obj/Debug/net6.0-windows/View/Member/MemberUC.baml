   M S B A M L   `   `   `  ����C  ?FLibrary, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null7 clr-namespace:FLibrary.View.BookFLibrary.View.Book  5      #    FLibrary.View.Member.MemberUC   5      W SPresentationCore, Version=6.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=6.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=6.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=6.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5      R NSystem.Xaml, Version=6.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5      @d2http://schemas.microsoft.com/expression/blend/2008     5      2local clr-namespace:FLibrary.View.Book     5      c _System.Windows.Interactivity, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35Bi:http://schemas.microsoft.com/expression/2010/interactivity  5      _ [MaterialDesignThemes.Wpf, Version=4.3.0.3, Culture=neutral, PublicKeyToken=df2a72020bd7962aFmaterialDesign1http://materialdesigninxaml.net/winfx/xaml/themes  5         MaterialDesignBody#���   5	      $��Regular"�5
      &   System.Windows.Media.TextOptions    TextFormattingMode$  Ideal=�5         TextRenderingMode$
 Auto=�5        MaterialDesignFont#���  5        MemberVM � DataContext# �  5       � 	Resources 5        Stl_btn_addnew �� 
TargetType # MaterialDesignFlatLightBgButton �� BasedOn �� Property �� Value �� Orientation'  !MaterialDesignThemes.Wpf.PackIcon	   Kind  Stl_btn_export  Stl_btn_edit  MaterialDesignFlatButton  Stl_btn_delete��%�  &	       7  &	 �    7  &	 M    7  &	 �    7  �� 5   
   " ��6'   8   .�5      ��  � ��$ Stretch=�6;   �� 5       � �� �#2c7be56+   �� 5       � �� �#2c7be56,   �� 5       � ��
 �����6+   �� 5       � ��$ 0 0 15 0q�6'   �� 5       � �� 5      �� 5      $ 
Horizontal=�6!   .+�5        $
	 Plus=�62   �� 5      $��10 0 0 0q�6$   $��ADD NEW��66   5      5      5       �� 5!   
   " ��6'   8   .�5"      ��  � ��$ Stretch=�6;   �� 5#       � �� �#2c7be56+   �� 5$       � �� �#2c7be56,   �� 5%       � ��
 �����6+   �� 5&       � ��$ 0 0 15 0q�6'   �� 5'       � �� 5(      �� 5)      $ 
Horizontal=�6!   .+�5*        $	 Download=�62   �� 5+      $��10 0 0 0q�6$   $��EXPORT��66   5,      5.      5/      �� 50   
   " ��6%   8   .�51      ��  � �� �#34364F6+   �� 52       � ��$ 5 0 5 0q�6(   53      �� 54   
   " ��6'   8   .�55      ��  � ��
 � E��6+   �� 56       � ��$ 5 0 5 0q�6(   �� 57       � ��$	 5 0q�6'   58      59      .��5:      � $��10q�6   
 � RowDefinitions
 5;   
   �� 5<      $	��.1* �6   �� 5=      $��* �6   �� 5>      $
��Auto �6   .+�5A   
   � $��0��6    � ColumnDefinitions 5B      �� 5C      $
��Auto �6#   �� 5D      $��* �6#   �� 5E      $
��Auto �6#   �� 5F      $
��Auto �6#   .+�5I      �� $��0��6   $
��Book��6(   $��Center=�64   $��10q�6O   $��18(�6[   
�������$��SemiBold"�6|   �� 5J      $��2��6   #��[ 6%   ��6M   �� *AddNewMemberCMD+�� 5K      $��3��6   #��[ 6%   ��6M   �� *	ExportCMD+�� 5M      $��1��6   
�������$	��0.3q�68   $��
15 10 5 10q�6N   $	��397��6b   $	��397��6q   $
��Left=�6�    �� CornerRadius$ 3��6�   ._�5N      �  5O       	 PrimaryHueMidBrush �� Color��%/   &		       �� 5P      $ Transparent��6E   5Q       5R      �� 5S      $	��.2* �6+   �� 5T      $��* �6+   .+�5V      �� $
��Auto��6   $
��Auto��6*   #��[ 68   
���������6j   0  *MaterialDesignThemes.Wpf.PackIconExtension     Kind$ Search=�   Size 196�   �� 5W      $��1��6   $	��5 0q�6.    �� 
CaretBrush
 �����$��Center=�6�   $��16(�6�   
�������)  #MaterialDesignThemes.Wpf.HintAssist   Hint$ Search��6�   
������ ��6<   �� *ContentSearch+ �� Mode$ TwoWay=� �� UpdateSourceTrigger$ PropertyChanged=�.��6#  .  (System.Windows.Interactivity.Interaction   Triggers 5X      /  )System.Windows.Interactivity.EventTrigger  5Y         	EventName$ TextChanged��6-   .  (System.Windows.Interactivity.TriggerBase   Actions. 5Z   "   6  0System.Windows.Interactivity.InvokeCommandAction     Command 68   �� *SearchMemberCMD+5[      .��5\   2   5]      5^      5_      5`      �� 5c   
   $��1��6   $	��0.7q�6   $ 	0 0 15 15��64   ._�5d      �� ��6   �� *	Members+��5e      �� 5f      " ��6    
 MaterialDesignGridViewItem# [
 66   .�5g      ��  � ��$ Center=�6G   �� 5h       � ��$ Center=�6E   �� 5i       � ��$ 15(�65   �� 5j       � ��$ 0q�64    �� Triggers 5k      P� 5l       P� Property �@��
IsSelected P� Value$
 true��6<   . �5m   "   ��  � �� �#041C326?   �� 5n   "    � �� �#041C326?   5o      5q       �� View 5s      �� 5t      .P�5v      �� ��5w      �� 5x   "   $��	Member ID��6,   
�������$��SemiBold"�6P   $��10 0 0 0q�6f    �� CellTemplate 5z      �� 5{   "   .R�5|   &   ��  ��Name$ id��60   ���#9a9cab��6<   �� *Id+6P   5}   #   5      �� 5�      ��5�      �� 5�   "   $��Member Name��6,   
�������$��SemiBold"�6R   $��10 0 0 0q�6h    5�      �� 5�   "   .R�5�   &   �� $
 name��60   ���#9a9cab��6>   �� *Name+6T   5�   #   5�      �� 5�      ��5�      �� 5�   "   $��Member Gender��6,   
�������$��SemiBold"�6T   $��10 0 0 0q�6j    5�      �� 5�   "   .R�5�   &   �� $ gender��60   ���#9a9cab��6@   �� *Gender+6X   5�   #   5�      �� 5�      ��5�      �� 5�   "   $��Date of Birth��6,   
�������$��SemiBold"�6T   $��10 0 0 0q�6j    5�      �� 5�   "   .R�5�   &   �� $	 dob��60   ���#9a9cab��6=   �� *DateOfBirth+ �� StringFormat$ 
dd-MM-yyyy��6u   5�   #   5�      �� 5�      ��5�      �� 5�   "   $��Phone��6,   
�������$��SemiBold"�6L   $��10 0 0 0q�6b    5�      �� 5�   "   .R�5�   &   �� $ phone��60   ���#9a9cab��6?   �� *Phone+6V   5�   #   5�      �� 5�      ��5�      �� 5�   "   $��Address��6,   
�������$��SemiBold"�6N   $��10 0 0 0q�6d    5�      �� 5�   "   .R�5�   &   �� $ address��60   ���#9a9cab��6A   �� *	Address+6Z   5�   #   5�      �� 5�      ��5�      �� 5�   "   $��Action��6,   
�������$��SemiBold"�6M   $��10 0 0 0q�6c    5�      �� 5�   "   .R�5�   &   �� $ 
Horizontal=�61   .+�5�   *   �� #��[ 61   ��6W   ��  �� RelativeSource ��   �� AncestorType  ListView! �� Path$! DataContext.EditMemberCMD���6�   �� .��5�   .     $
	 Edit=�6F   $��19��6R   $��19��6]   ���#ECB3656i   5�   +   �� 5�   *   #��[ 61   $��0��6Y   ��6g   ��  ��   ListView$!! DataContext.DeleteMemberCMD���6�   �� .��5�   .     $	 Delete=�6F   $��19��6T   $��19��6_   5�   +   5�   '   5�   #   5�      5�      5�      5�      5�      5�      
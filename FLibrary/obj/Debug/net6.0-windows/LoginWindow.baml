   M S B A M L   `   `   `  ����C  ?FLibrary, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null;"clr-namespace:FLibrary.Helper.BaseFLibrary.Helper.Base  5   	       FLibrary.LoginWindow   5   	   W SPresentationCore, Version=6.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=6.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=6.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=6.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5   	   R NSystem.Xaml, Version=6.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   5helper"clr-namespace:FLibrary.Helper.Base     5   	   c _System.Windows.Interactivity, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35Bi:http://schemas.microsoft.com/expression/2010/interactivity  5   	   _ [MaterialDesignThemes.Wpf, Version=4.3.0.3, Culture=neutral, PublicKeyToken=df2a72020bd7962aFmaterialDesign1http://materialdesigninxaml.net/winfx/xaml/themes  5	   	   -   5        $��loginWindow��5   	      MaterialDesignBody#���   5
   	   $��Regular"�5   	   &   System.Windows.Media.TextOptions    TextFormattingMode$  Ideal=�5   	      TextRenderingMode$
 Auto=�5   	     MaterialDesignFont#���  5   	    � Title$ LoginWindow��5   	   $	��400��6   $	��700��6*    � WindowStyle$
 None=�5   	    � 
ResizeMode$ NoResize=�6    � WindowStartupLocation$ CenterScreen=�62     LoginVM � DataContext# [ 5   	   
������  � AllowsTransparency$
 True��5   "    � WindowState 6<   �� *WindowState+.  (System.Windows.Interactivity.Interaction	   Triggers	 5      /  )System.Windows.Interactivity.EventTrigger  5   
   
   	EventName$
 MouseLeftButtonDown��6   .  (System.Windows.Interactivity.TriggerBase   Actions. 5      6  0System.Windows.Interactivity.InvokeCommandAction     Command 6$   �� *DragMoveCMD+   CommandParameter 6D   ��  �� RelativeSource ��  �� AncestorType
 Window5       � 	Resources 5        PrimaryCorlor �� Color  SecondPrimaryCorlor  PrimaryHueLightBrush " PrimaryHueLightForegroundBrush  PrimaryHueMidBrush   PrimaryHueMidForegroundBrush 	 PrimaryHueDarkBrush !
 PrimaryHueDarkForegroundBrush  SecondaryHueMidBrush " SecondaryHueMidForegroundBrush��%�  &	       &	 !     &	 B     &	 c     &	 �     &	 �     &		 �     &	
 �     &	     &	 )    �� 5   
   $ #051E31��60   �� 5   
   $ #1F3959��66   �� 5    
   $ #13548A��67   �� 5!   
   $ #FFFFFF��6A   �� 5"   
   $ #5C5B5E��65   �� 5#   
   $ #FFFFFF��6?   �� 5$   
   $ #13548A��66   �� 5%   
   $ #FFFFFF��6@   �� 5(   
   $ #5C5B5E��67   �� 5)   
   $ #FFFFFF��6A   5*      .��5+      ?  9MaterialDesignThemes.Wpf.Transitions.TransitioningContent  C  =MaterialDesignThemes.Wpf.Transitions.TransitioningContentBase   OpeningEffects 5,   
   ;  5MaterialDesignThemes.Wpf.Transitions.TransitionEffect  5-         Kind$ ExpandIn=�6.      Duration$ 0:0:0.8h�6>     5.      $ SlideInFromTop=�6.   .��50   
   �  � ColumnDefinitions 51      �� 52      $��1* �6#   �� 53      $��1* �6#   .+�56      #	  MaterialDesignThemes.Wpf.Card	  $��0 5 0 5q�6"   $��1��63   ���#07074c.��57      �  � ShowGridLines$ False��6    � RowDefinitions 58      �� 59      $	��13* �6(   �� 5:      $	��10* �6(   �� 5;      $��3* �6(    5=      �� 5>      $��* �6+   �� 5?      $��* �6+   .+�5A      �� $��0��6    $��118,0,0,116q�6-   $��WELCOME��6B   
�������$��28(�6d   $��Bottom=�6r   $
��Left=�6�   $��2��6�   �� 5B      $��8,8,8,8q�6   $��/library.png��6-   $��Uniform=�6C   $��3��6U   $��2��6f   �� 5C      $��
68,137,0,0q�6    $��1��64   $��Library Management��6A   
�������$��24(�6n   $	��Top=�6|   $
��Left=�6�   $��2��6�   $��2��6�   5D      5E      	  5H      $��0��6"   $��0 5 0 5q�62   .��5I      � ���#07074c 5J      �� 5K      $��* �6(   �� 5L      $��2* �6(   �� 5M      $��* �6(   �� 5N      $��* �6(   �� 5O      $��* �6(   �� 5P      $��* �6(   �� 5Q      $��* �6(   .+�5U      �� $��0��6    $��LOGIN��6-   $��Bottom=�6:   $��Center=�6U   $��24(�6r   ���#7c27ef6�   �� 5V      $��1��6   $��0 0 0 10q�6*   $��Bottom=�6<   ���#7c27ef���#7c27ef
������� , (MaterialDesignFloatingActionAccentButton#��[ 5W      -
  'System.Windows.Input.KeyboardNavigation 
  TabNavigation$
 None=�6�   ��6[   0  *MaterialDesignThemes.Wpf.PackIconExtension     Kind$ 
ShieldLock=�   Size 296�   �� 5Z      
�������$��2��61   $��
19 0 19 10q�6>   $��16(�6R   $��Bottom=�6`   )  #MaterialDesignThemes.Wpf.HintAssist   Hint$ Username��6�   
���������5[      �� *CurrentAccount.Email+ �� UpdateSourceTrigger$ PropertyChanged=�G� 5\      )   #FLibrary.Helper.Base.PasswordHelper   Attach$
 True��6"   
�������$��3��6�   $��	19 0 19 0q�6�   $��16(�6�   $��Bottom=�6�   $ Password��6  
�������   Password 6F   �� *CurrentAccount.Password+$ PropertyChanged=� �� Mode$ TwoWay=�6G  �� 5`      
�������
�������$��4��6E   $��17 0 0 0q�6R   $��Remember Password��6d   �� 5a      $��5��6   $��
15 10 15 0q�6+   ���#7c27ef���#7c27ef$��Login��6j     �� 	IsDefault$
  True��5b   l   ��6   �� *
LoginCMD+��67   �� ! �� ElementName$! loginWindow��6l   �� 5c      $��6��6    $��Center=�6�   $��Center=�6�     LOGIN_FAILED#���  6�   $��SemiBold"�6�   
���  ��y�6-   �� *ShowTextWhenLoginFailed+   BooleanToVisibilityConverter" �� 	Converter#" [ 6  5e      5f      �� 5i      $��2��6   # �� Orientation$# 
Horizontal=�6)   $��Right=�6B   $	��Top=�6^   $
��0 10q�6v   .+�5j      �� 
������ 
������ ��6L     $ WindowMinimize=���6�   �� *MinimizedWindowCMD+�� 5k      
������ 
������ ��6L     $ Close=���6{   �� *CloseWindowCMD+5l      5n      5o      5p      
GDPC                                                                                 @   res://.import/entity.png-63a8a7ef2c232c6280ab8805cbf8fe8e.stex  �"      �       ��A�n}zh�V致iF<   res://.import/icon.png-487276ed1e3a0c39cad0279d744ee560.stex C      �      �p��<f��r�g��.�   res://GameScene.gd.remap�_      $       ϕ��0��xJ���z��   res://GameScene.gdc �      ,      ��;�sƥ�>k�0�1�   res://GameScene.tscn�            ���jC&�����f"�   res://default_env.tres  �	      
      �?�թ+Ev�/h�!b�   res://derp.cer        d      Ӹe|�"��|A�&�   res://entity/Entity.gd.remap�_      (       �����#XpzU$.l=   res://entity/Entity.gdc �      �      �t듯�/tF����   res://entity/Entity.tscn      f      |�13 �t0�1��C��    res://entity/entity.png.import  @#      <      R%GYX[_��P�;�4   res://gamestate.gd.remap�_      $       �����,�ϵ#g   res://gamestate.gdc �%      �      V �!5���2��=|N   res://godot/Socket.gd.remap  `      '       ��:�SL��;(�   res://godot/Socket.gdc  P5      �      �3��Z$�'�#�,�   res://icon.png  �`      i      ����󈘥Ey��
�   res://icon.png.import   �P      ]      ��Ќ7�8-�(N��a[�(   res://network_menu/NetworkMenu.gd.remap P`      3       =*`����C|2ً$   res://network_menu/NetworkMenu.gdc   S      N      ʭA7B�cr�AR��
��$   res://network_menu/NetworkMenu.tscn PU      2
       *�#�SA_)�J2i   res://project.binary n      B      �Zm1��W���tt�        GDSC            V      ���Ӷ���   �����������Ŷ���   �����϶�   �����������϶���   �����϶�   ������������Ŷ��   �������ض���   ������������ض��   ������Ŷ   ��������Ҷ��   ����������������¶��                            	      
                           	      
         2      =      E      F      G      H      N      R      T      5TT:=�  TT3�  LMR�  �  �  0TT3�  L�  MR�  =�  �  L�!  L�  N�  MN�!  L�  N�  MM�  �  P�  S�  P�  �  �  S�  P�	  L�  MTTTT3�
  LMR�  �  LM�  0T[    [gd_scene load_steps=2 format=2]

[ext_resource path="res://GameScene.gd" type="Script" id=1]

[node name="GameScene" type="Node"]

script = ExtResource( 1 )
spawn_radius = 25

[node name="SpawnPosition" type="Position2D" parent="." index="0"]

position = Vector2( 50, 50 )
_sections_unfolded = [ "Transform" ]

[node name="Players" type="Node" parent="." index="1"]

[node name="HTTPRequest" type="HTTPRequest" parent="." index="2"]

download_file = ""
use_threads = false
body_size_limit = -1
max_redirects = 8


             [gd_resource type="Environment" load_steps=2 format=2]

[sub_resource type="ProceduralSky" id=1]

radiance_size = 4
sky_top_color = Color( 0.0470588, 0.454902, 0.976471, 1 )
sky_horizon_color = Color( 0.556863, 0.823529, 0.909804, 1 )
sky_curve = 0.25
sky_energy = 1.0
ground_bottom_color = Color( 0.101961, 0.145098, 0.188235, 1 )
ground_horizon_color = Color( 0.482353, 0.788235, 0.952941, 1 )
ground_curve = 0.01
ground_energy = 1.0
sun_color = Color( 1, 1, 1, 1 )
sun_latitude = 35.0
sun_longitude = 0.0
sun_angle_min = 1.0
sun_angle_max = 100.0
sun_curve = 0.05
sun_energy = 16.0
texture_size = 2

[resource]

background_mode = 2
background_sky = SubResource( 1 )
background_sky_custom_fov = 0.0
background_color = Color( 0, 0, 0, 1 )
background_energy = 1.0
background_canvas_max_layer = 0
ambient_light_color = Color( 0, 0, 0, 1 )
ambient_light_energy = 1.0
ambient_light_sky_contribution = 1.0
fog_enabled = false
fog_color = Color( 0.5, 0.6, 0.7, 1 )
fog_sun_color = Color( 1, 0.9, 0.7, 1 )
fog_sun_amount = 0.0
fog_depth_enabled = true
fog_depth_begin = 10.0
fog_depth_curve = 1.0
fog_transmit_enabled = false
fog_transmit_curve = 1.0
fog_height_enabled = false
fog_height_min = 0.0
fog_height_max = 100.0
fog_height_curve = 1.0
tonemap_mode = 0
tonemap_exposure = 1.0
tonemap_white = 1.0
auto_exposure_enabled = false
auto_exposure_scale = 0.4
auto_exposure_min_luma = 0.05
auto_exposure_max_luma = 8.0
auto_exposure_speed = 0.5
ss_reflections_enabled = false
ss_reflections_max_steps = 64
ss_reflections_fade_in = 0.15
ss_reflections_fade_out = 2.0
ss_reflections_depth_tolerance = 0.2
ss_reflections_roughness = true
ssao_enabled = false
ssao_radius = 1.0
ssao_intensity = 1.0
ssao_radius2 = 0.0
ssao_intensity2 = 1.0
ssao_bias = 0.01
ssao_light_affect = 0.0
ssao_color = Color( 0, 0, 0, 1 )
ssao_quality = 0
ssao_blur = 3
ssao_edge_sharpness = 4.0
dof_blur_far_enabled = false
dof_blur_far_distance = 10.0
dof_blur_far_transition = 5.0
dof_blur_far_amount = 0.1
dof_blur_far_quality = 1
dof_blur_near_enabled = false
dof_blur_near_distance = 2.0
dof_blur_near_transition = 1.0
dof_blur_near_amount = 0.1
dof_blur_near_quality = 1
glow_enabled = false
glow_levels/1 = false
glow_levels/2 = false
glow_levels/3 = true
glow_levels/4 = false
glow_levels/5 = true
glow_levels/6 = false
glow_levels/7 = false
glow_intensity = 0.8
glow_strength = 1.0
glow_bloom = 0.0
glow_blend_mode = 2
glow_hdr_threshold = 1.0
glow_hdr_scale = 2.0
glow_bicubic_upscale = false
adjustment_enabled = false
adjustment_brightness = 1.0
adjustment_contrast = 1.0
adjustment_saturation = 1.0

            0�`0�H�	�`'�D5?T3|�V�	�0	*�H�� 0J10	UUS10U
Let's Encrypt1#0!ULet's Encrypt Authority X30190220052220Z190521052220Z010Unolic.simmarith.com0�"0	*�H�� � 0�
� �>P��!���:#ft���,���3*@���ۨ�r���9`����w���g�D���+�Q���`q��O#M���<-0�Q������ �l�6�jw�w�4_h��eܽ��Y���,}̩�����;'�XY=�'�3��p��3�{t��'��Ʃd�N6�0~�u%IV�{w�Q�����2'�����wc�������u�G�\1b:�s��p�E����v���wq=K���wa�#�)���):��×��K� ��j0�f0U��0U%0++0U�0 0U�e�[�ݨ�!凷�I�)�ib�0U#0��Jjc}ݺ��9��Ee���0o+c0a0.+0�"http://ocsp.int-x3.letsencrypt.org0/+0�#http://cert.int-x3.letsencrypt.org/0U0�nolic.simmarith.com0LU E0C0g�07+��0(0&+http://cps.letsencrypt.org0�
+�y���� � w t~ڃ1�3�!��%OBp¿�^B �75y�{�V  i	�   H0F! �ڎ\�'��d���巫�"�nLN�)�BZ�]!! щi����z�T#��LmO�Q�X�!˟X� w c����;�,�r�'Wk3��aw��u�8��hTK؍  i	��Z   H0F! ��V�����篴 $���)��!��|�Z�e��! ��`P
H�L�H�o�� �]�ۏƶ��0	*�H�� � �a~وX�3z�W4��ш�T�Jג/�1?��)�B��R�\Ov$��� gD_�Xh,m���C��&�l�X��3hy�-�����xC� �Ok?��WZ��XTu�$�����q��Z:,u
g�+����E���2:��7���6hM�+Qt�<R_��3�(����SЀ-_�tF�$��u2O�Ipc���Lq���6�>�#+��ܕ��D�QW+d��6dfdY:!��q2����r����u"�v            GDSC         $   �      ������������τ�   �����������򶶶�   ��������Ŷ��   �����������ض���   �����϶�   ���������������Ŷ���   ����׶��   �����ض�   ����������������Ķ��   ���¶���   �������ض���   ����¶��   ����������������Ҷ��   �������������Ӷ�   �������Ӷ���   ���Ӷ���   ����ڶ��   ���¶���     �B   	   slave_pos      	   move_left                         
   move_right        move_up    	   move_down                            	                           	      
   "      #      $      %      '      (      /      6      <      C      L      V      _      h      q      {      �      �      �      �      �      �       �   !   �   "   �   #   �   $   5TT<�  TTG=�  �  LMTG=�  �  LMTTTT3�  LMR�  �  �  �  0TT3�  L�  MR�  =�  �  LM�  &�  LMR�  �	  L�  N�
  M�  &�  P�  L�  MR�  �  �  L�  N�  M�  &�  P�  L�  MR�  �  �  L�  N�  M�  &�  P�  L�  MR�  �  �  L�  N�  M�  &�  P�  L�  MR�  �  �  L�  N�  M�  �  (R�  �
  �  �  �  �  L�  �  M�  &�  LMR�  �  �
  T3�  L�  MR�  S�  P�  �  [               [gd_scene load_steps=4 format=2]

[ext_resource path="res://entity/Entity.gd" type="Script" id=1]
[ext_resource path="res://entity/entity.png" type="Texture" id=2]

[sub_resource type="RectangleShape2D" id=1]

custom_solver_bias = 0.0
extents = Vector2( 16, 16 )

[node name="Entity" type="KinematicBody2D"]

input_pickable = false
collision_layer = 3
collision_mask = 3
collision/safe_margin = 0.08
script = ExtResource( 1 )
_sections_unfolded = [ "Collision", "Pickable", "collision" ]

[node name="Sprite" type="Sprite" parent="." index="0"]

texture = ExtResource( 2 )

[node name="CollisionShape2D" type="CollisionShape2D" parent="." index="1"]

shape = SubResource( 1 )

[node name="Label" type="Label" parent="." index="2"]

anchor_left = 0.0
anchor_top = 0.0
anchor_right = 0.0
anchor_bottom = 0.0
margin_left = -20.0
margin_top = -30.0
margin_right = 20.0
margin_bottom = -16.0
rect_pivot_offset = Vector2( 0, 0 )
rect_clip_content = false
mouse_filter = 2
mouse_default_cursor_shape = 0
size_flags_horizontal = 1
size_flags_vertical = 4
text = "test"
percent_visible = 1.0
lines_skipped = 0
max_lines_visible = -1


          GDST                 �   PNG �PNG

   IHDR           szz�   _IDATX��ס�@DџJ9IH�9I�D�s8�
X��o֥�6 &���-��=���%tݏw�7 @�  @� շ���4���� \_��s�    IEND�B`�        [remap]

importer="texture"
type="StreamTexture"
path="res://.import/entity.png-63a8a7ef2c232c6280ab8805cbf8fe8e.stex"

[deps]

source_file="res://entity/entity.png"
dest_files=[ "res://.import/entity.png-63a8a7ef2c232c6280ab8805cbf8fe8e.stex" ]

[params]

compress/mode=0
compress/lossy_quality=0.7
compress/hdr_mode=0
compress/normal_map=0
flags/repeat=0
flags/filter=false
flags/mipmaps=false
flags/anisotropic=false
flags/srgb=2
process/fix_alpha_border=true
process/premult_alpha=false
process/HDR_as_SRGB=false
stream=false
size_limit=0
detect_3d=true
svg/scale=1.0
    GDSC   8      z   r     ���Ӷ���   �����������ⶶ��   ��������嶶�   ��������涶�   ����������Ӷ   ������Ŷ   ������������������Ҷ   ����������������Ҷ��   �������������������Ҷ���   ���������Ҷ�   ���������Ķ�   ���¶���   ���������¶�   ���Ķ���   �����������������������¶���   ����   ������������Ķ��   �������Ӷ���   ���������������Ķ���   �������������׶�   ���������Ӷ�   ����������Ķ   ������������¶��   �������׶���   ����������   ��������������������Ҷ��   ����Ҷ��   �������Ӷ���   �������¶���   ��������Ҷ��   �����Ķ�   ���Ӷ���   �������Ӷ���   �����������������Ķ�   �����������϶���   ��������������Ķ   �Ҷ�   ��������������Ӷ   ����������������Ķ��   �����Ҷ�   ���Ҷ���   ����������Ķ   �������Ӷ���   ����������������Ķ��   ����Ӷ��   ����������������Ҷ��   �������������������Ҷ���   �������Ӷ���   ����������ڶ   �������Ӷ���   ������������ݶ��   ��ն   �������������������Ҷ���   ��������������ڶ   �����϶�   ������¶  G)                  	   127.0.0.1      
   The Client        network_peer      res://GameScene.tscn      res://entity/Entity.tscn      register_player                /root/GameScene/Players       /root/GameScene    
   game_error        Player         disconnected         unregister_player         connection_succeeded      Server disconnected           connection_failed         network_peer_connected        _player_connected         network_peer_disconnected         _player_disconnected      connected_to_server       _connected_ok         _connected_fail       server_disconnected       _server_disconnected                         	      
                     	      
                                 %      &      '      ,      1      6      ;      A      B      H      Q      Z      c      h      i      j      n       o   !   p   "   v   #      $   �   %   �   &   �   '   �   (   �   )   �   *   �   +   �   ,   �   -   �   .   �   /   �   0   �   1   �   2   �   3   �   4   �   5   �   6     7     8     9     :     ;     <     =     >   %  ?   +  @   9  A   D  B   E  C   F  D   M  E   Y  F   b  G   i  H   p  I   z  J   {  K   �  L   �  M   �  N   �  O   �  P   �  Q   �  R   �  S   �  T   �  U   �  V   �  W   �  X   �  Y   �  Z   �  [   �  \   �  ]   �  ^   �  _   �  `   �  a   �  b   �  c   �  d   �  e   �  f   �  g   �  h   �  i      j     k     l     m     n     o     p     q   #  r   (  s   )  t   /  u   <  v   I  w   V  x   c  y   p  z   5TTT<�  TTT<�  �  TT<�  �  TTT=�  �  TTT=�  JKTTTB�  LMTB�  LMTB�  LMTB�	  LMTB�
  L�  MTT3�  LMR�  =�  �  P�  LM�  �  P�  L�  N�  M�  �  LMP�  L�  M�  �  L�  M�  �  �  �  LM�  TT3�  LMR�  =�  �  P�  LM�  �  P�  L�  N�  M�  �  LMP�  L�  M�  �  L�  M�  T3�  L�  MR�  �  LMP�  L�  N�  MTT3�  LMR�  =�  �  LMP�  LM�  �  =�  ?L�  MP�  LM�  �  LMP�  LMP�  L�  M�  �  �  =�  ?L�  MP�  LM�  �  P�  �  L�  M�  �  P�   L�  M�  �  P�!  L�  M�  �  P�"  L�  M�  TTTD3�#  L�$  N�%  MR�  �  &�  LMP�&  LMR�  �  �'  L�$  N�  N�  N�  M�  )�(  �  R�  �'  L�$  N�  N�(  N�  H�(  IM�  �'  L�(  N�  N�$  N�%  MT�  �  �  H�$  I�%  �  =�)  ?L�  MP�  LM�  �)  P�  �  L�$  M�  �)  P�   L�%  M�  �)  P�!  L�$  M�  �*  L�	  MP�  L�)  M�  TD3�+  L�$  MR�  �  P�,  L�$  M�  TT3�-  L�$  MR�  �  �  0TTT3�.  L�$  MR�  &�  LMP�&  LMR�  &�/  L�
  MR�  �0  L�  N�  �  H�$  I�  M�  �1  LM�  (R�  �  �+  L�$  M�  )�(  �  R�  �  �'  L�(  N�  N�$  MTTT3�2  LMR�  �  �3  L�  N�  LMP�  LMN�  M�  �  �  �  LM�  �0  L�  MTTT3�4  LMR�  �0  L�  N�  M�  �1  LMTTT3�5  LMR�  �  LMP�  L�  M�  �0  L�  MTT3�6  LMR�  �  LMP�7  L�  NN�  M�  �  LMP�7  L�  NN�  M�  �  LMP�7  L�  NN�  M�  �  LMP�7  L�  NN�  M�  �  LMP�7  L�  NN�  MT[   GDSC   5      �        ���Ӷ���   ���¶���   �ƶ�   ����Ѷ��   ���������ض�   ���������۶�   ��������Ҷ��   ������¶   ����Ķ��   �����϶�   ������¶   �����Ѷ�   ��Ѷ   ����������Ҷ   ���Ŷ���   ����϶��   ���������¶�   ������������涶�   ����   ��������������¶   ����Ķ��   ��������Ҷ��   ������������Ӷ��   �����������¶���   ������¶   ����¶��   ����������Ŷ   �����Ѷ�   ���¶���   ���¶���   �������¶���   ���������Ŷ�   ���������������򶶶�   ���������������۶���   ��������������Ķ   �����������   �����������䶶��   �������������������������¶�   ���׶���   ������Ķ   �����׶�   �����ض�   ���Ҷ���   �������Ӷ���   �������¶���   �����ٶ�   ���������¶�   �����������������¶�   ���ƶ���   �����������Ҷ���   �������Ŷ���   ����׶��   ������Ķ            	   127.0.0.1                                   Test   
   [SOCKET]:         timeout       _TimeoutDisconnect        connecting...      
   Connected!                  welcome       type      AUTH      action        login         username      /root/EditUsername        password      /root/EditPassword     
   authorized        /root/SceneManager        lobby         Disconnecting...                                                           	      
                           $      )      .      1      2      8      =      ?      @      A      B      I      O      V      W      X      Y      Z       `   !   c   "   d   #   e   $   f   %   g   &   n   '   o   (   y   )   }   *   ~   +      ,   �   -   �   .   �   /   �   0   �   1   �   2   �   3   �   4   �   5   �   6   �   7   �   8   �   9   �   :   �   ;   �   <   �   =   �   >   �   ?   �   @   �   A   �   B   �   C   �   D   �   E   �   F      G     H     I   !  J   "  K   #  L   )  M   2  N   >  O   G  P   L  Q   M  R   T  S   ^  T   b  U   g  V   l  W   x  X   �  Y   �  Z   �  [   �  \   �  ]   �  ^   �  _   �  `   �  a   �  b   �  c   �  d   �  e   �  f   �  g   �  h   �  i   �  j   �  k   �  l   �  m   �  n   �  o   �  p   �  q   �  r   �  s   �  t   �  u   �  v   �  w   �  x   �  y   �  z   �  {   �  |   �  }   �  ~   �     �  �   �  �     �     �   5TTTTT<�  T=�  �  T=�  �  OTTTTT=�  �  T=�  �  T=�  �  T=�  �  T=�  TT3�	  LMR�  �
  L�  M�  0TTTT3�  L�  MR�  &L�  MR�  �7  L�  �  MTTTTT3�  LMR�  1�  TTTTT3�
  L�  MR�  �  &L�  P�  LMMR�  �  LMT�  �  �  �  P�  LM�  �  P�  L�  N�  M�  �  �  �  �  P�  LM�  �  L�  M�  �  P�  L�  M�  �  P�  L�  M�  �  P�  L�  NN�	  M�  �  P�  LM�  �  �  �  L�  M�  �  �  S�  �  P�  �
  TTT3�  LMR�  �  &L�  �  P�  LM�  P�   MR�  �  �  �  �  �  �!  P�  LM�  �  P�"  L�  M�  �  �  &L�  P�  LM�  P�#  �  P�  LM�  P�$  MR�  �  L�  M�  �  LM�  �  �  &L�  MR�  S�  �  P�  �  �  &L�  P�%  LM�  MR�  =�&  �  P�'  LM�  �(  L�&  MTT3�(  L�&  MR�  &L�&  P�)  �  MR�  �*  LJ�  �  R�  N�  �  R�  N�  �  R�+  L�  MP�,  LMN�  �  R�+  L�  MP�,  LM�  KM�  �  �  &L�&  P�)  �  MR�  �+  L�  MP�-  L�  MTTTTT3�  LMR�  &L�  MR�  �  P�.  LM�  �  �  �  S�  �  P�  �  TTTTTTTTTT3�/  LMR�  �  P�0  LM�  �1  L�  M�  �  &L�  MR�  �  LMTTTTT3�2  L�3  MR�  �  LMTTTTT3�*  L�&  MR�  &L�&  �  MR�  �  P�4  L�&  MT[            GDST@   @           |  PNG �PNG

   IHDR   @   @   �iq�  ?IDATx��{pTU�����;�N7	�����%"fyN�8��r\]fEgةf���X�g��F�Y@Wp\]|,�D@��	$$���	��I�n���ҝt����JW�s��}�=���|�D(���W@T0^����f��	��q!��!i��7�C���V�P4}! ���t�ŀx��dB.��x^��x�ɏN��贚�E�2�Z�R�EP(�6�<0dYF���}^Ѡ�,	�3=�_<��(P&�
tF3j�Q���Q�B�7�3�D�@�G�U��ĠU=� �M2!*��[�ACT(�&�@0hUO�u��U�O�J��^FT(Qit �V!>%���9 J���jv	�R�@&��g���t�5S��A��R��OO^vz�u�L�2�����lM��>tH
�R6��������dk��=b�K�љ�]�י�F*W�볃�\m=�13� �Є,�ˏy��Ic��&G��k�t�M��/Q]�أ]Q^6o��r�h����Lʳpw���,�,���)��O{�:א=]� :LF�[�*���'/���^�d�Pqw�>>��k��G�g���No���\��r����/���q�̾��	�G��O���t%L�:`Ƶww�+���}��ݾ ۿ��SeŔ����  �b⾻ǰ��<n_�G��/��8�Σ�l]z/3��g����sB��tm�tjvw�:��5���l~�O���v��]ǚ��֩=�H	u���54�:�{"������}k����d���^��`�6�ev�#Q$�ήǞ��[�Ặ�e�e��Hqo{�59i˲����O+��e������4�u�r��z�q~8c
 �G���7vr��tZ5�X�7����_qQc�[����uR��?/���+d��x�>r2����P6����`�k��,7�8�ɿ��O<Ė��}AM�E%�;�SI�BF���}��@P�yK�@��_:����R{��C_���9������
M��~����i����������s���������6�,�c�������q�����`����9���W�pXW]���:�n�aұt~9�[���~e�;��f���G���v0ԣ� ݈���y�,��:j%gox�T
�����kְ�����%<��A`���Jk?���� gm���x�*o4����o��.�����逊i�L����>���-���c�����5L����i�}�����4����usB������67��}����Z�ȶ�)+����)+H#ۢ�RK�AW�xww%��5�lfC�A���bP�lf��5����>���`0ċ/oA-�,�]ĝ�$�峋P2/���`���;����[Y��.&�Y�QlM���ƌb+��,�s�[��S ��}<;���]�:��y��1>'�AMm����7q���RY%9)���ȡI�]>�_l�C����-z�� ;>�-g�dt5іT�Aͺy�2w9���d�T��J�}u�}���X�Ks���<@��t��ebL������w�aw�N����c����F���3
�2먭�e���PQ�s�`��m<1u8�3�#����XMڈe�3�yb�p�m��܇+��x�%O?CmM-Yf��(�K�h�بU1%?I�X�r��� ��n^y�U�����1�玒�6..e��RJrRz�Oc������ʫ��]9���ZV�\�$IL�OŨ��{��M�p�L56��Wy��J�R{���FDA@
��^�y�������l6���{�=��ή�V�hM�V���JK��:��\�+��@�l/���ʧ����pQ��������׷Q^^�(�T������|.���9�?I�M���>���5�f欙X�VƎ-f͚ո���9����=�m���Y���c��Z�̚5��k~���gHHR�Ls/l9²���+ ����:��杧��"9�@��ad�ŝ��ѽ�Y���]O�W_�`Ֆ#Դ8�z��5-N^�r�Z����h���ʆY���=�`�M���Ty�l���.	�/z��fH���������֗�H�9�f������G� ̛<��q��|�]>ں}�N�3�;i�r"�(2RtY���4X���F�
�����8 �[�\锰�b`�0s�:���v���2�f��k�Zp��Ω&G���=��6em.mN�o.u�fԐc��i����C���u=~{�����a^�UH������¡,�t(jy�Q�ɋ����5�Gaw��/�Kv?�|K��(��SF�h�����V��xȩ2St쯹���{6b�M/�t��@0�{�Ԫ�"�v7�Q�A�(�ľR�<	�w�H1D�|8�]�]�Ո%����jҢ꯸hs�"~꯸P�B�� �%I}}��+f�����O�cg�3rd���P�������qIڻ]�h�c9��xh )z5��� �ƾ"1:3���j���'1;��#U�失g���0I}�u3.)@�Q�A�ĠQ`I�`�(1h��t*�:�>'��&v��!I?�/.)@�S�%q�\���l�TWq�������լ�G�5zy6w��[��5�r���L`�^���/x}�>��t4���cݦ�(�H�g��C�EA�g�)�Hfݦ��5�;q-���?ư�4�����K����XQ*�av�F��������񵏷�;>��l�\F��Þs�c�hL�5�G�c�������=q�P����E �.���'��8Us�{Ǎ���#������q�HDA`b��%����F�hog���|�������]K�n��UJ�}������Dk��g��8q���&G����A�RP�e�$'�i��I3j�w8������?�G�&<	&䪬R��lb1�J����B$�9�꤮�ES���[�������8�]��I�B!
�T
L:5�����d���K30"-	�(��D5�v��#U�����jԔ�QR�GIaó�I3�nJVk���&'��q����ux��AP<�"�Q�����H�`Jң�jP(D��]�����`0��+�p�inm�r�)��,^�_�rI�,��H>?M-44���x���"� �H�T��zIty����^B�.��%9?E����П�($@H!�D��#m�e���vB(��t �2.��8!���s2Tʡ �N;>w'����dq�"�2����O�9$�P	<(��z�Ff�<�z�N��/yD�t�/?�B.��A��>��i%�ǋ"�p n� ���]~!�W�J���a�q!n��V X*�c �TJT*%�6�<d[�    IEND�B`�        [remap]

importer="texture"
type="StreamTexture"
path="res://.import/icon.png-487276ed1e3a0c39cad0279d744ee560.stex"

[deps]

source_file="res://icon.png"
dest_files=[ "res://.import/icon.png-487276ed1e3a0c39cad0279d744ee560.stex" ]

[params]

compress/mode=0
compress/lossy_quality=0.7
compress/hdr_mode=0
compress/bptc_ldr=0
compress/normal_map=0
flags/repeat=0
flags/filter=true
flags/mipmaps=false
flags/anisotropic=false
flags/srgb=2
process/fix_alpha_border=true
process/premult_alpha=false
process/HDR_as_SRGB=false
process/invert_color=false
stream=false
size_limit=0
detect_3d=true
svg/scale=1.0
   GDSC             O      ���Ӷ���   �����϶�   ���������������Ҷ���   ��������Ӷ��   ����������Ķ   ����ڶ��   ���Ӷ���   ���������������Ҷ���   ���������¶�   ������������������������Ҷ��   ����������Ӷ   �������Ӷ���   ���¶���                                                    	      
                           %      &      '      -      3      :      ;      <      B      M      5TTTTTT3�  LMR�  �  �  0TT3�  LMR�  �  P�  LM�  S�  P�  LMTTT3�  LMR�  �  P�  LM�  S�  P�  LMTTT3�	  LMR�  �  P�
  S�  �  P�  T[  [gd_scene load_steps=2 format=2]

[ext_resource path="res://network_menu/NetworkMenu.gd" type="Script" id=1]

[node name="NetworkMenu" type="Node" index="0"]

script = ExtResource( 1 )

[node name="Panel" type="Panel" parent="." index="0"]

anchor_left = 0.0
anchor_top = 0.0
anchor_right = 0.0
anchor_bottom = 0.0
margin_right = 323.0
margin_bottom = 338.0
rect_pivot_offset = Vector2( 0, 0 )
rect_clip_content = false
mouse_filter = 0
mouse_default_cursor_shape = 0
size_flags_horizontal = 1
size_flags_vertical = 1

[node name="Username" type="TextEdit" parent="Panel" index="0"]

anchor_left = 0.0
anchor_top = 0.0
anchor_right = 0.0
anchor_bottom = 0.0
margin_left = 77.0
margin_top = 63.0
margin_right = 239.0
margin_bottom = 142.0
rect_pivot_offset = Vector2( 0, 0 )
rect_clip_content = false
focus_mode = 2
mouse_filter = 0
mouse_default_cursor_shape = 0
size_flags_horizontal = 1
size_flags_vertical = 1
text = ""
readonly = false
highlight_current_line = false
syntax_highlighting = false
show_line_numbers = false
highlight_all_occurrences = false
override_selected_font_color = false
context_menu_enabled = true
smooth_scrolling = false
v_scroll_speed = 80.0
hiding_enabled = 0
wrap_lines = false
caret_block_mode = false
caret_blink = false
caret_blink_speed = 0.65
caret_moving_by_right_click = true

[node name="Join" type="Button" parent="Panel" index="1"]

anchor_left = 0.0
anchor_top = 0.0
anchor_right = 0.0
anchor_bottom = 0.0
margin_left = 85.0
margin_top = 247.0
margin_right = 228.0
margin_bottom = 324.0
rect_pivot_offset = Vector2( 0, 0 )
rect_clip_content = false
focus_mode = 2
mouse_filter = 0
mouse_default_cursor_shape = 0
size_flags_horizontal = 1
size_flags_vertical = 1
toggle_mode = false
enabled_focus_mode = 2
shortcut = null
group = null
text = "Join"
flat = false
align = 1
_sections_unfolded = [ "Rect" ]

[node name="Host" type="Button" parent="Panel" index="2"]

anchor_left = 0.0
anchor_top = 0.0
anchor_right = 0.0
anchor_bottom = 0.0
margin_left = 85.0
margin_top = 159.0
margin_right = 228.0
margin_bottom = 236.0
rect_pivot_offset = Vector2( 0, 0 )
rect_clip_content = false
focus_mode = 2
mouse_filter = 0
mouse_default_cursor_shape = 0
size_flags_horizontal = 1
size_flags_vertical = 1
toggle_mode = false
enabled_focus_mode = 2
shortcut = null
group = null
text = "Host"
flat = false
align = 1

[connection signal="text_changed" from="Panel/Username" to="." method="_on_Username_text_changed"]

[connection signal="pressed" from="Panel/Join" to="." method="_on_Join_pressed"]

[connection signal="pressed" from="Panel/Host" to="." method="_on_Host_pressed"]


              [remap]

path="res://GameScene.gdc"
            [remap]

path="res://entity/Entity.gdc"
        [remap]

path="res://gamestate.gdc"
            [remap]

path="res://godot/Socket.gdc"
         [remap]

path="res://network_menu/NetworkMenu.gdc"
             �PNG

   IHDR   @   @   �iq�  0IDATx��}pTU����L����W�$�@HA�%"fa��Yw�)��A��Egةf���X�g˱��tQ���Eq�!�|K�@BHH:�t>�;�����1!ݝn�A�_UWw����{λ��sϽO�q汤��X,�q�z�<�q{cG.;��]�_�`9s��|o���:��1�E�V� ~=�	��ݮ����g[N�u�5$M��NI��-
�"(U*��@��"oqdYF�y�x�N�e�2���s����KҦ`L��Z)=,�Z}"
�A�n{�A@%$��R���F@�$m������[��H���"�VoD��v����Kw�d��v	�D�$>	�J��;�<�()P�� �F��
�< �R����&�կ��� ����������%�u̚VLNfڠus2�̚VL�~�>���mOMJ���J'R��������X����׬X�Ϲ虾��6Pq������j���S?�1@gL���±����(�2A�l��h��õm��Nb�l_�U���+����_����p�)9&&e)�0 �2{��������1���@LG�A��+���d�W|x�2-����Fk7�2x��y,_�_��}z��rzy��%n�-]l����L��;
�s���:��1�sL0�ڳ���X����m_]���BJ��im�  �d��I��Pq���N'�����lYz7�����}1�sL��v�UIX���<��Ó3���}���nvk)[����+bj�[���k�������cݮ��4t:= $h�4w:qz|A��٧�XSt�zn{�&��õmQ���+�^�j�*��S��e���o�V,	��q=Y�)hԪ��F5~����h�4 *�T�o��R���z�o)��W�]�Sm銺#�Qm�]�c�����v��JO��?D��B v|z�կ��܈�'�z6?[� ���p�X<-���o%�32����Ρz�>��5�BYX2���ʦ�b��>ǣ������SI,�6���|���iXYQ���U�҅e�9ma��:d`�iO����{��|��~����!+��Ϧ�u�n��7���t>�l捊Z�7�nвta�Z���Ae:��F���g�.~����_y^���K�5��.2�Zt*�{ܔ���G��6�Y����|%�M	���NPV.]��P���3�8g���COTy�� ����AP({�>�"/��g�0��<^��K���V����ϫ�zG�3K��k���t����)�������6���a�5��62Mq����oeJ�R�4�q�%|�� ������z���ä�>���0�T,��ǩ�����"lݰ���<��fT����IrX>� � ��K��q�}4���ʋo�dJ��م�X�sؘ]hfJ�����Ŧ�A�Gm߽�g����YG��X0u$�Y�u*jZl|p������*�Jd~qcR�����λ�.�
�r�4���zپ;��AD�eЪU��R�:��I���@�.��&3}l
o�坃7��ZX��O�� 2v����3��O���j�t	�W�0�n5����#è����%?}����`9۶n���7"!�uf��A�l܈�>��[�2��r��b�O�������gg�E��PyX�Q2-7���ʕ������p��+���~f��;����T	�*�(+q@���f��ϫ����ѓ���a��U�\.��&��}�=dd'�p�l�e@y��
r�����zDA@����9�:��8�Y,�����=�l�֮��F|kM�R��GJK��*�V_k+��P�,N.�9��K~~~�HYY��O��k���Q�����|rss�����1��ILN��~�YDV��-s�lfB֬Y�#.�=�>���G\k֬fB�f3��?��k~���f�IR�lS'�m>²9y���+ �v��y��M;NlF���A���w���w�b���Л�j�d��#T��b���e��[l<��(Z�D�NMC���k|Zi�������Ɗl��@�1��v��Щ�!曣�n��S������<@̠7�w�4X�D<A`�ԑ�ML����jw���c��8��ES��X��������ƤS�~�׾�%n�@��( Zm\�raҩ���x��_���n�n���2&d(�6�,8^o�TcG���3���emv7m6g.w��W�e
�h���|��Wy��~���̽�!c� �ݟO�)|�6#?�%�,O֫9y������w��{r�2e��7Dl �ׇB�2�@���ĬD4J)�&�$
�HԲ��
/�߹�m��<JF'!�>���S��PJ"V5!�A�(��F>SD�ۻ�$�B/>lΞ�.Ϭ�?p�l6h�D��+v�l�+v$Q�B0ūz����aԩh�|9�p����cƄ,��=Z�����������Dc��,P��� $ƩЩ�]��o+�F$p�|uM���8R��L�0�@e'���M�]^��jt*:��)^�N�@�V`�*�js�up��X�n���tt{�t:�����\�]>�n/W�\|q.x��0���D-���T��7G5jzi���[��4�r���Ij������p�=a�G�5���ͺ��S���/��#�B�EA�s�)HO`���U�/QM���cdz
�,�!�(���g�m+<R��?�-`�4^}�#>�<��mp��Op{�,[<��iz^�s�cü-�;���쾱d����xk瞨eH)��x@���h�ɪZNU_��cxx�hƤ�cwzi�p]��Q��cbɽcx��t�����M|�����x�=S�N���
Ͽ�Ee3HL�����gg,���NecG�S_ѠQJf(�Jd�4R�j��6�|�6��s<Q��N0&Ge
��Ʌ��,ᮢ$I�痹�j���Nc���'�N�n�=>|~�G��2�)�D�R U���&ՠ!#1���S�D��Ǘ'��ೃT��E�7��F��(?�����s��F��pC�Z�:�m�p�l-'�j9QU��:��a3@0�*%�#�)&�q�i�H��1�'��vv���q8]t�4����j��t-}IـxY�����C}c��-�"?Z�o�8�4Ⱦ���J]/�v�g���Cȷ2]�.�Ǣ ��Ս�{0
�>/^W7�_�����mV铲�
i���FR��$>��}^��dُ�۵�����%��*C�'�x�d9��v�ߏ � ���ۣ�Wg=N�n�~������/�}�_��M��[���uR�N���(E�	� ������z��~���.m9w����c����
�?���{�    IEND�B`�       ECFG      application/config/name         Godot_MP   application/run/main_scene,      #   res://network_menu/NetworkMenu.tscn    application/config/icon         res://icon.png     autoload/gamestate         *res://gamestate.gd    input/move_up@              InputEventKey         resource_local_to_scene           resource_name             device               alt           shift             control           meta          command           pressed           scancode  W          unicode              echo          script            input/move_down@              InputEventKey         resource_local_to_scene           resource_name             device               alt           shift             control           meta          command           pressed           scancode  S          unicode              echo          script            input/move_left@              InputEventKey         resource_local_to_scene           resource_name             device               alt           shift             control           meta          command           pressed           scancode  A          unicode              echo          script            input/move_right@              InputEventKey         resource_local_to_scene           resource_name             device               alt           shift             control           meta          command           pressed           scancode  D          unicode              echo          script            layer_names/2d_physics/layer_1         player     layer_names/2d_physics/layer_2         entity     network/ssl/certificates         res://derp.cer  )   rendering/environment/default_environment          res://default_env.tres                GDPC
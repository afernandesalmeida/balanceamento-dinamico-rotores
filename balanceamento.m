% Calculo do balanceamento Dinamico de rotores
% Desenvolvido por André Fernandes

clear all; close all; clc;

% O Calculo do balanceamento já é feito considerando adição de massa

% A        B        C      D        E
% |________|________|______|________|
% |--z_A---|--z_C --|      |        |
% |        |-------z_D-----|        |
% |        |-----------z_E----------|
%
% B e D são os planos desconhecidos para o balanceamento
% z é a distancia do ponto B ao analisado na somatoria de momentos

m_A=100; m_C=150; m_E=50; %massas conhecidas
r_A=250; r_B=250; r_C=250; r_D=250; r_E=250; %raios conhecidos
z_A=200; z_B=0; z_C=200; z_D=700; z_E=1000; %distancia em z
teta_A=30; teta_C=270; teta_E=150; %angulos conhecidos em graus

%Conversão de graus para radianos para que possa ser utilizado nas
%funçoes sin() e cos()

t_A=degtorad(teta_A);
t_C=degtorad(teta_C);
t_E=degtorad(teta_E);

% Calculo de teta D
%(Eq. desenvolvida a partir do somatorio de Momentos em B)
t_D=atan2((m_A*r_A*sin(t_A)*z_A - m_C*r_C*sin(t_C)*z_C - m_E*r_E*sin(t_E)*z_E),(m_A*r_A*cos(t_A)*z_A - m_C*r_C*cos(t_C)*z_C - m_E*r_E*cos(t_E)*z_E));

% Conversão de teta D de radianos para graus tornando de fácil entendimento
%para o usuário
teta_D =radtodeg(t_D)

% Calculo de m_D*r_D
mr_D = ((((m_A*r_A*sin(t_A)*z_A - m_C*r_C*sin(t_C)*z_C - m_E*r_E*sin(t_E)*z_E)^2) + ((m_A*r_A*cos(t_A)*z_A - m_C*r_C*cos(t_C)*z_C - m_E*r_E*cos(t_E)*z_E)^2))^(1/2))*(1/z_D);

% Calculo da massa de D
m_D=mr_D/r_D

% Calculo de teta B
%(Eq. desenvolvida a partir do somatorio de Forças em X e Y)
t_B = atan2((-m_A*r_A*sin(t_A) - m_C*r_C*sin(t_C) - m_D*r_D*sin(t_D) - m_E*r_E*sin(t_E)),(-m_A*r_A*cos(t_A) - m_C*r_C*cos(t_C) - m_D*r_D*cos(t_D) - m_E*r_E*cos(t_E)));

% Conversão de teta B de radianos para graus tornando de fácil entendimento
%para o usuário
teta_B =radtodeg(t_B)

% Calculo de m_B*r_B
mr_B = (((-m_A*r_A*sin(t_A) - m_C*r_C*sin(t_C) - m_D*r_D*sin(t_D) - m_E*r_E*sin(t_E))^2) + ((-m_A*r_A*cos(t_A) - m_C*r_C*cos(t_C) - m_D*r_D*cos(t_D) - m_E*r_E*cos(t_E))^2))^(1/2);

% Calculo da massa de B
m_B=mr_B/r_B

% Verificação do balanceamento
Fx = (m_A*r_A*cos(t_A) + m_B*r_B*cos(t_B) + m_C*r_C*cos(t_C) + m_D*r_D*cos(t_D) + m_E*r_E*cos(t_E))/1000
Fy = (m_A*r_A*sin(t_A) + m_B*r_B*sin(t_B) + m_C*r_C*sin(t_C) + m_D*r_D*sin(t_D) + m_E*r_E*sin(t_E))/1000

R = sqrt((Fx^2) + (Fy^2))
t_R = atan2(Fy,Fx);
teta_R = radtodeg(t_R)
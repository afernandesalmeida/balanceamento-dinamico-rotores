% Calculo do balanceamento Dinamico de rotores
% Desenvolvido por Andr� Fernandes

clear all; close all; clc;

% O Calculo do balanceamento j� � feito considerando adi��o de massa

% A        B        C      D        E
% |________|________|______|________|
% |--z_A---|--z_C --|      |        |
% |        |-------z_D-----|        |
% |        |-----------z_E----------|
%
% B e D s�o os planos desconhecidos para o balanceamento
% z � a distancia do ponto B ao analisado na somatoria de momentos

m_A=100; m_C=150; m_E=50; %massas conhecidas
r_A=250; r_B=250; r_C=250; r_D=250; r_E=250; %raios conhecidos
z_A=200; z_B=0; z_C=200; z_D=700; z_E=1000; %distancia em z
teta_A=30; teta_C=270; teta_E=150; %angulos conhecidos em graus
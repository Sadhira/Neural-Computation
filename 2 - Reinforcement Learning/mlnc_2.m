%% MLNC 2

%% step 1: paper and initialisation

[S,A,T,R, StateNames, ActionNames, Absorbing] = GridWorld1();

[UnbiasedPolicy] = GetUnbiasedPolicy(Absorbing, A);

% in the form of: 
% rows = current state
% colums = 4 possible directions ~(N E S W)

% each cell p of moving in a given direction (action) given current state
% p of moving from absorbing states is zero
% s4 is goal and s7 is penalty


%% step 2: paper

%% step 3, 4: 

gamma = 0.9;
tol = 0.001;
iter = 0;

[V, iter, x, D] = PolicyEvaluation(UnbiasedPolicy, T, R, Absorbing, gamma, tol, iter)

% 52 iterations for tol = 0.001

%% step 5: greedy policy

[GreedyPolicy] = GreedyPolicyFromV(V, T, R, Absorbing, gamma);

%  index          name
% 1 2 3 4       S1 S2 S3  S4
% 5 # 6 7   --> S5 #  S6  S7
% 8 9 10 11     S8 S9 S10 S11 


% Actions are as follows: 
%index       name
% 1    -->   N
% 2    -->   E
% 3    -->   S
% 4    -->   W


% 2

n = 1;
m = 1;

GreedyVis = zeros(4,4);

for n = 1:4
    for m = 1:4
        if GreedyPolicy(n,m) == 1
            GreedyVis(n,m) = m;
        end
    end
end

GreedyVisFixed = [2 2 2 0; 1 -1 1 0; 1 2 1 4]

%% step 5: higher penalty


gamma = 0.9;
tol = 0.001;
iter2 = 0;


R2 = R;

for l = 1:11
    for m = 1:11
        for n = 1:4
            if R2(l,m,n) == -10
                R2(l,m,n) = -100;
            end
        end
    end
end

[V, iter2, x, D] = PolicyEvaluation(UnbiasedPolicy, T, R2, Absorbing, gamma, tol, iter)

% iter2 = 111

[GreedyPolicy2] = GreedyPolicyFromV(V, T, R2, Absorbing, gamma);

%%


R3 = R;

for l = 1:11
    for m = 1:11
        for n = 1:4
            if R2(l,m,n) == -10
                R2(l,m,n) = -10000000000000000;
            end
        end
    end
end


[GreedyPolicy3] = GreedyPolicyFromV(V, T, R3, Absorbing, gamma);


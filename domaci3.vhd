Library ieee;
Use ieee.std_logic_1164.all;

entity potpuni_sabirac is
port(a, b, cin :in std_logic;
    sum, carry :out std_logic);
end potpuni_sabirac;

Architecture potpuni_sabirac_arhitektura of potpuni_sabirac is
component polu_sabirac is
port(p, q :in std_logic;
    s, cy; :out std_logic);
end component;

component or_gate is
port(p1, q1 :in std_logic;
    r1 :out std_logic);
end component;

signal s1, c1, c2 : std_logic;
begin
    w1: polu_sabirac port map(a, b, s1, c1);
    w2: polu_sabirac port map(s1, cin, sum, c2);
    w3: or_gate port map(c1, c2, carry);
end potpuni_sabirac_arhitektura;

entity polu_sabirac is
port (p, q :in std_logic;
    s, cy :out std_logic);
end polu_sabirac;
architecture polu_sabirac_arhitektura of polu_sabirac is
begin
    s <= p xor q;
    cy <= p and q;
end polu_sabirac_arhitektura;

entity or_gate is
port(p1, q1 :in std_logic;
    r1 :out std_logic);
end or_gate;
architecture or_gate_arhitektura of or_gate is
begin
    r1 <= p1 or q1;
end or_gate_arhitektura;

entity devetobitni_sabirac is
    port (Cin :in std_logic;
        x8             :in std_logic;
        x7, x6, x5, x4 :in std_logic;
        x3, x2, x1, x0 :in std_logic;
        y8             :in std_logic;
        y7, y6, y5, y4 :in std_logic;
        y3, y2, y1, y0 :in std_logic;
        s8             :in std_logic;
        s7, s6, s5, s4 :out std_logic;
        s3, s2, s1, s0 :out std_logic;
        c :out std_logic);
end devetobitni_sabirac;
architecture devetobitni_sabirac_arhitektura of devetobitni_sabirac is
    signal p1, p2, p3, p4, p5, p6, p7, p8 :in std_logic;
    component potpuni_sabirac
        port (a, b, cin :in std_logic;
            sum, carry :out std_logic);
    end component
begin
    phase0: potpuni_sabirac port map (x0, y0, Cin, s0, p1);
    phase1: potpuni_sabirac port map (x1, y1, p1, s1, p2);
    phase2: potpuni_sabirac port map (x2, y2, p2, s2, p3);
    phase3: potpuni_sabirac port map (x3, y3, p3, s3, p4);
    phase4: potpuni_sabirac port map (x4, y4, p4, s4, p5);
    phase5: potpuni_sabirac port map (x5, y5, p5, s5, p6);
    phase6: potpuni_sabirac port map (x6, y6, p6, s6, p7);
    phase7: potpuni_sabirac port map (x7, y7, p7, s7, p8);
    phase8: potpuni_sabirac port map (x8, y8, p8, s8, c);
end devetobitni_sabirac_arhitektura;

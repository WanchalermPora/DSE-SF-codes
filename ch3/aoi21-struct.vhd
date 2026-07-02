-- File: aoi21-struct.vhd (architecture only)
architecture Structural of aoi21 is
    signal n_and : STD_ULOGIC;  -- NAND(I0, I1)
    signal n_I2  : STD_ULOGIC;  -- NAND(I2, I2)
    signal n_AOI : STD_ULOGIC;  -- NAND(n_and, n_I2)
begin

    -- U1: n_and = NAND(I0, I1)
    U1: entity work.nand2(alternative)
        port map (
            I0      => I0,
            I1      => I1,
            O_NAND  => n_and
        );

    -- U2: n_I2 = NAND(I2, I2) = NOT(I2)
    U2: entity work.nand2(direct)
        port map (
            I0      => I2,
            I1      => I2,
            O_NAND  => n_I2
        );

    -- U3: n_AOI = NAND(n_and, n_I2)
    U3: entity work.nand2(alternative)
        port map (
            I0      => n_and,
            I1      => n_I2,
            O_NAND  => n_AOI
        );

    -- U4: O_AOI = NAND(n_AOI, n_AOI) = NOT(n_AOI)
    U4: entity work.nand2(direct)
        port map (
            I0      => n_AOI,
            I1      => n_AOI,
            O_NAND  => O_AOI
        );

end architecture Structural;

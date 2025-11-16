// Verilog Code 3.3: Non-synthesizable File I/O and System Tasks.
// These commands are for the simulator (the "host computer")
// and have no hardware equivalent.
initial begin
    integer file_handle;
    reg [7:0] data_to_log;
    
    // 1. Open a file (File I/O)
    file_handle = $fopen("output_log.txt", "w");

    // 2. Display to console (System Task)
    $display("Simulation started. Logging to file...");
    
    // 3. Write to file (File I/O)
    data_to_log = 8'hDE;
    $fdisplay(file_handle, "Logged data: %h", data_to_log);
    
    // 4. Stop simulation (System Task)
    #100;
    $display("Simulation finished.");
    $fclose(file_handle); // Close the file
    $stop; // Halt the simulator
end
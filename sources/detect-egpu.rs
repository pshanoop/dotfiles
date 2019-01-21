// This could have been a bash script.
// But since I want to sudo it, I feel it safer if it's a plain ol' binary.
//
// Plus, it's fun to use something different once in a while.

use std::fs::copy;
use std::fs::remove_file;
use std::path::Path;
use std::thread::sleep;
use std::time::Duration;

fn main() {
    let path = "/sys/bus/thunderbolt/devices/0-1/device";

    let orig = "/etc/X11/xorg.conf.d/90-egpu.orig";
    let conf = "/etc/X11/xorg.conf.d/90-egpu.conf";

    let mut cont = 10;

    // Sleep and keep retrying in case the eGPU is taking a bit to turn up.
    while cont != 0 {
        if Path::new(path).exists() {
            let res = copy(orig, conf);
            res.unwrap();

            cont = 0;
            println!("eGPU found: Enabled support")
        } else {
            // Deliberately ignore errors here. Failure to remove this is
            // acceptable.
            let _ = remove_file(conf);

            cont = cont - 1;
            println!("eGPU no found: Disabled support");
            sleep(Duration::from_millis(500));
        }
    }
}

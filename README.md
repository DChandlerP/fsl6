# FSL 6.0

"FSL is a comprehensive library of analysis tools for FMRI, MRI, and DTI brain imaging data."

## Documentation

[Official FSL Documentation](https://fsl.fmrib.ox.ac.uk/fsl/fslwiki)

Included Software:

* Functional MRI: FEAT, MELODIC, FABBER, BASIL, VERBENA
* Structural MRI: BET, FAST, FIRST, FLIRT & FNIRT, FSLVBM, SIENA & SIENAX, MIST, BIANCA, MSM, fsl\_anat
* Diffusion MRI: FDT, TBSS, XTRACT, eddy, topup, eddyqc
* GLM /Stats: GLM general advice, Randomise, PALM, Cluster, FDR, Dual Regression, Mm, FLOBS
* Other: FSLeyes, FSLView, Fslutils, Atlases, Atlasquery, SUSAN, FUGUE, MCFLIRT, Miscvis, POSSUM, BayCEST

[FSL Course](http://fsl.fmrib.ox.ac.uk/fslcourse/)

This image is based on: https://hub.docker.com/r/diannepat/fsl6

### FSL Installer Script

```RUN /fslinstaller.py -d /usr/local/fsl```

This image uses the installer script and gives the script a path that helps make the script non-interactive.
Adding `-q` after the path argument will run the script in quiet mode. However, the script takes such a long time to run
that it is probably better to let it be verbose to see errors. The post-install script fails, but the code seems to work despite this.
It appears that the programmers did not want these errors to return an error code.

### FSL Configuration Script

```RUN /bin/bash -c 'source /usr/local/fsl/etc/fslconf/fsl.sh'```

The shell script that runs is precisely what several other containers with FSL6.0 lacked. Without it, one cannot run code
from the command line as they do not have the paths to each application.

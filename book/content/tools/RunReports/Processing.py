"""
This file is used to store functions that are used in the notebook.
The aim is to keep the notebook relatively clean.
"""

def McCaffreyHeight(height, HRR):
    """
    This function normalises the height of a devices by the energy release of the burner.
    
    :param height: height above fire source, in m.
    :param height: total energy release, in kW.
    
    :return: normalised height
    """
    normalised_height = height / HRR ** (2/5)
    
    return normalised_height
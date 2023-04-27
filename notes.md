[Link to code](https://github.com/oskopek/mvae)
# Code Map
- `mt/` is the main folder

1. `data/` - Data loading, preprocessing, batching, pre-trained embeddings
    - `image_reconstruction.py` - Loading, making loaders and defining reconstruction loss for the 4 datasets
    - `representation_dataset.py` - Create loaders, define other stuff for datasets with a special form
    - `synthetic.py` - Classes for creating binary diffusion process dataset synthetically
    - `vae_dataset.py` - Parent class for other dataset classes
2. `examples/` - Contains main executable file. Reads flags, runs corresponding training/evaluation
    - `eval.py` - Code to run for evaluation
    - `run.py` - Code to run for training
3. `visualization/` - Utilities for visualization of latents spaces/training statistics
    - `generate_plots.py`
    - `latent_space.py`
    - `read_log.py`
    - `samples.py`
    - `utils.py` 
4. `mvae/` - Model directory. Code map in next subsection
5. `utils.py` - A function to convert string to bool

## `mvae/`

### Folders
1. `components/`
    - `component.py` - Parent class `Component`, then different child classes for hyperbolic, spherical, etc, taken from `ops/`
2. `distributions/`
    - `ars.py` - Adaptive rejection sampling code
    - `hyperbolic_radius.py` - Used in Riemannian Normal
    -  `hyperspherical_uniform.py` - Defining uniform distribution over hypersphere
    - `pvae_utils.py` - Some utility functions
    - `riemannian_normal.py` - Define class for Riemannian Normal distribution
    - `von_mises_fisher.py` - Define von Mises Fisher (vMF) distribution
    - `wrapped_distributions.py` - Define parent class `VaeDistribution`, along with Euclidean Normal and Uniform distributions
    - `wrapped_normal.py` - Define Wrapped Normal distribution
3. `models/` - Defines vaious neural networks and NN utilities
    - `conv_vae.py` - Convolution VAE
    - `ffnn_vae.py` - Feed forward NN VAE
    - `layers.py` - Defines `GraphConvolution` layer
    - `train.py` - To train the NN. Defines `Trainer` class
    - `vae.py` - VAE. Defines `ModelVAE` parent class
4. `ops/`
    - `common.py` - Functions/classes commonly needed
    - `euclidean.py` - Defines Euclidean manifold class
    - `hyperbolics.py` - Defines Hyperboloid manifold class
    - `ive.py` - Defines ive function. Used by vMF distribution
    - `manifold.py` - Defines `Manifold` and `RadiusManifold` parent classes
    - `poincare.py` - Defines Poincare Ball manifold class
    - `spherical.py` - Defines Sphere manifold class
    - `spherical_projected.py` - Defines stereographically projected sphere manifold class
    - `universal.py` - Defines universal manifold class
5. `sampling/`
    - `sampling_procedures.py` - Defines classes for different sampling procedures

### Files
1. `all_models.py` - Bin component models into their various types (S, H, D, etc)
2. `stats.py` - Classes for batch and epoch statistics
3. `utils.py` - Utility functions, and class for curvature optimizer


# Code walkthrough order

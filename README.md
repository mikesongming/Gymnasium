[![Python](https://img.shields.io/pypi/pyversions/gymnasium.svg)](https://badge.fury.io/py/gymnasium)
[![PyPI](https://badge.fury.io/py/gymnasium.svg)](https://badge.fury.io/py/gymnasium)
[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.8127025.svg)](https://doi.org/10.5281/zenodo.8127025)
[![pre-commit](https://img.shields.io/badge/pre--commit-enabled-brightgreen?logo=pre-commit&logoColor=white)](https://pre-commit.com/)
[![Code style: black](https://img.shields.io/badge/code%20style-black-000000.svg)](https://github.com/psf/black)

<p align="center">
    <img src="https://raw.githubusercontent.com/Farama-Foundation/Gymnasium/main/gymnasium-text.png" width="500px"/>
</p>

Gymnasium is an open source Python library for developing and comparing reinforcement learning algorithms by providing a standard API to communicate between learning algorithms and environments, as well as a standard set of environments compliant with that API. This is a fork of OpenAI's [Gym](https://github.com/openai/gym) library by its maintainers (OpenAI handed over maintenance a few years ago to an outside team), and is where future maintenance will occur going forward.

The documentation website is at [gymnasium.farama.org](https://gymnasium.farama.org), and we have a public discord server (which we also use to coordinate development work) that you can join here: https://discord.gg/bnJ6kubTg6

## Environments

Gymnasium includes the following families of environments along with a wide variety of third-party environments
* [Classic Control](https://gymnasium.farama.org/environments/classic_control/) - These are classic reinforcement learning based on real-world problems and physics.
* [Box2D](https://gymnasium.farama.org/environments/box2d/) - These environments all involve toy games based around physics control, using box2d based physics and PyGame-based rendering
* [Toy Text](https://gymnasium.farama.org/environments/toy_text/) - These environments are designed to be extremely simple, with small discrete state and action spaces, and hence easy to learn. As a result, they are suitable for debugging implementations of reinforcement learning algorithms.
* [MuJoCo](https://gymnasium.farama.org/environments/mujoco/) - A physics engine based environments with multi-joint control which are more complex than the Box2D environments.
* [Atari](https://gymnasium.farama.org/environments/atari/) - A set of 57 Atari 2600 environments simulated through Stella and the Arcade Learning Environment that have a high range of complexity for agents to learn.
* [Third-party](https://gymnasium.farama.org/environments/third_party_environments/) - A number of environments have been created that are compatible with the Gymnasium API. Be aware of the version that the software was created for and use the `apply_env_compatibility` in `gymnasium.make` if necessary.

## Installation

To install the base Gymnasium library, use
`pip install 'git+https://github.com/mikesongming/Gymnasium.git#egg=gymnasium[all]' `

We support and test for Python 3.9, 3.10 on Linux and macOS. We will accept PRs related to Windows, but do not officially support it.

## API

The Gymnasium API models environments as simple Python `env` classes. Creating environment instances and interacting with them is very simple- here's an example using the "CartPole-v1" environment:

```python
import gymnasium as gym
env = gym.make("CartPole-v1")

observation, info = env.reset(seed=42)
for _ in range(1000):
    action = env.action_space.sample()
    observation, reward, terminated, truncated, info = env.step(action)

    if terminated or truncated:
        observation, info = env.reset()
env.close()
```

## Notable Related Libraries

Please note that this is an incomplete list, and just includes libraries that the maintainers most commonly point newcommers to when asked for recommendations.

* [CleanRL](https://github.com/vwxyzjn/cleanrl) is a learning library based on the Gymnasium API. It is designed to cater to newer people in the field and provides very good reference implementations.
* [PettingZoo](https://github.com/Farama-Foundation/PettingZoo) is a multi-agent version of Gymnasium with a number of implemented environments, i.e. multi-agent Atari environments.
* The Farama Foundation also has a collection of many other [environments](https://farama.org/projects) that are maintained by the same team as Gymnasium and use the Gymnasium API.
* [Comet](https://www.comet.com/site/?utm_source=gymnasium&utm_medium=partner&utm_campaign=partner_gymnasium_2023&utm_content=github) is a free ML-Ops tool that tracks rewards, metrics, hyperparameters, and code for ML training runs. Comet has an easy-to use integration with Gymnasium, here's a [tutorial](https://bit.ly/CometGymnasiumIntegration) on how to use them together! Comet is a sponsor of the Farama Foundation!



## Environment Versioning

Gymnasium keeps strict versioning for reproducibility reasons. All environments end in a suffix like "-v0".  When changes are made to environments that might impact learning results, the number is increased by one to prevent potential confusion. These inherit from Gym.

## Development Roadmap

We have a roadmap for future development work for Gymnasium available here: https://github.com/Farama-Foundation/Gymnasium/issues/12

## Support Gymnasium's Development

If you are financially able to do so and would like to support the development of Gymnasium, please join others in the community in [donating to us](https://github.com/sponsors/Farama-Foundation).

## Citation

You can cite Gymnasium as:

```
@misc{towers_gymnasium_2023,
        title = {Gymnasium},
        url = {https://zenodo.org/record/8127025},
        abstract = {An API standard for single-agent reinforcement learning environments, with popular reference environments and related utilities (formerly Gym)},
        urldate = {2023-07-08},
        publisher = {Zenodo},
        author = {Towers, Mark and Terry, Jordan K. and Kwiatkowski, Ariel and Balis, John U. and Cola, Gianluca de and Deleu, Tristan and Goulão, Manuel and Kallinteris, Andreas and KG, Arjun and Krimmel, Markus and Perez-Vicente, Rodrigo and Pierré, Andrea and Schulhoff, Sander and Tai, Jun Jet and Shen, Andrew Tan Jin and Younis, Omar G.},
        month = mar,
        year = {2023},
        doi = {10.5281/zenodo.8127026},
}
```

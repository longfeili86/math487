# an example of interactive applicaiton created using the IPython widget interact.

import matplotlib.pyplot as plt
import numpy as np
from scipy import stats

def f(mu):
    X = stats.norm(loc=mu,scale=np.sqrt(mu))
    N = stats.poisson(mu)
    x = np.linspace(0,X.ppf(0.999))
    n = np.arange(0,x[-1])

    fig, ax=plt.subplots()
    ax.plot(x,X.pdf(x),color='black',lw=2,label="Normal ($\mu=%d, \sigma^2=%d$)" %(mu,mu))
    ax.bar(n,N.pmf(n),align='edge',label=r"Poisson($\lambda=%d$)" % mu)
    ax.set_ylim(0,X.pdf(x).max()*1.25)
    ax.legend(loc=2,ncol=2)
    plt.close(fig)
    return fig


from ipywidgets import interact
import ipywidgets as widgets
interact(f,mu=widgets.FloatSlider(min=1.0,max=20.0,step=1.0))

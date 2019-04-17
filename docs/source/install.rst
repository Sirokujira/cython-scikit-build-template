Installation Guide
==================

.. contents:: :local:

Recommended Environments
------------------------

* `Ubuntu <http://www.ubuntu.com/>`_ 14.04/16.04 64bit
* `MacOS <https://www.apple.com/macos/>`_ 10.9/10.10/10.11/10.12
* `Windows <https://www.microsoft.com/>`_ 7/8.1/10 64bit

The following versions of Python can be used: 2.7.6+, 3.5.1+, and 3.6.0+.

template is supported on Python 2.7.6+, 3.4.0, 3.5.0+, 3.6.0+.
template uses C++ compiler such as g++/clang++.

Dependencies
------------

Before installing template, we recommend to upgrade ``setuptools`` if you are using an old one::

  $ pip install -U setuptools

The following Python packages are required to install template.
The latest version of each package will automatically be installed if missing.

* `NumPy <http://www.numpy.org/>`_ 1.9, 1.10, 1.11, 1.12, 1.13
* `Cython <http://cython.readthedocs.io/en/latest/index.html>`_ >=0.25.2

Install template
----------------

Install template via pip
~~~~~~~~~~~~~~~~~~~~~~~~

We recommend to install template via pip::

  $ pip install template

.. note::

   All optional PointCloudLibrary related libraries, need to be installed before installing template.
   After you update these libraries, please reinstall template because you need to compile and link to the newer version of them.


Install template from source
~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The tarball of the source tree is available via ``pip download template`` or from `the release notes page <https://github.com/Sirokujira/template/releases>`_.
You can use ``setup.py`` to install template from the tarball::

  $ tar zxf template-x.x.x.tar.gz
  $ cd template-x.x.x
  $ python setup.py install

You can also install the development version of template from a cloned Git repository::

  $ git clone https://github.com/Sirokujira/template.git
  $ cd pcl/Python
  $ python setup.py install


.. _install_error:

When an error occurs...
~~~~~~~~~~~~~~~~~~~~~~~

Use ``-vvvv`` option with ``pip`` command.
That shows all logs of installation.
It may help you::

  $ pip install template -vvvv


.. _install_PointCloudLibrary:


Install template for developers
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

template uses Cython (>=0.28.5).
Developers need to use Cython to regenerate C++ sources from ``pyx`` files.
We recommend to use ``pip`` with ``-e`` option for editable mode::

  $ pip install -U cython
  $ cd /path/to/template/source
  $ pip install -e .

Users need not to install Cython as a distribution package of template only contains generated sources.


Uninstall template
------------------

Use pip to uninstall template::

  $ pip uninstall template

.. note::

   When you upgrade template, ``pip`` sometimes install the new version without removing the old one in ``site-packages``.
   In this case, ``pip uninstall`` only removes the latest one.
   To ensure that template is completely removed, run the above command repeatedly until ``pip`` returns an error.


Upgrade template
----------------

Just use ``pip`` with ``-U`` option::

  $ pip install -U template


Reinstall template
--------------------

If you want to reinstall template, please uninstall template and then install it.
We recommend to use ``--no-cache-dir`` option as ``pip`` sometimes uses cache::

  $ pip uninstall template
  $ pip install template --no-cache-dir

When you install template without PointCloudLibrary, and after that you want to use PointCloudLibrary, please reinstall template.
You need to reinstall template when you want to upgrade PointCloudLibrary.


FAQ
---

Check build module link.(windows: pyx, MacOSX/Ubuntu: so)

Windows
  dependency Walker: 
  $depends.exe (filename).pyx

  GUI: check nothing ? Marks.

MacOSX
  $ltool -L . (filename).so

Ubuntu
  $ldd (filename).so


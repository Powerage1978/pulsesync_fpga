====
Test
====

This is a great test.

Inline UML

.. uml::

   Alice -> Bob: Hi!
   Alice <- Bob: How are you?

Referenced UML file


.. uml:: ./puml/test.puml


Inline wavedrom

.. wavedrom::

        { "signal": [
                { "name": "pclk", "wave": "p......." },
                { "name": "Pclk", "wave": "P......." },
                { "name": "nclk", "wave": "n......." },
                { "name": "Nclk", "wave": "N......." },
                {},
                { "name": "clk0", "wave": "phnlPHNL" },
                { "name": "clk1", "wave": "xhlhLHl." },
                { "name": "clk2", "wave": "hpHplnLn" },
                { "name": "clk3", "wave": "nhNhplPl" },
                { "name": "clk4", "wave": "xlh.L.Hx" }
        ]}


Referenced WaveDrom files

.. wavedrom:: ./wavedrom/test.json

Some random text

.. wavedrom:: ./wavedrom/bitfield.json

Some more random text

.. wavedrom:: ./wavedrom/bitfield2.json
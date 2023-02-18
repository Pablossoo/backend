<?php

use Imbo\BehatApiExtension\Context\ApiContext;
use Behat\Behat\Context\Context;

/**
 * Defines application features from the specific context.
 */
class FeatureContext extends ApiContext implements Context
{
    /**
     * Initializes context.
     *
     * Every scenario gets its own context instance.
     * You can also pass arbitrary arguments to the
     * context constructor through behat.yml.
     */
    public function __construct()
    {
    }

    /**
     * @Then I want to print response
     */
    public function iWantToPrintResponse()
    {
        dump($this->response);
    }

    /**
     * @Then I want to print response body
     */
    public function iWantToPrintResponseBody()
    {
        dump($this->getResponseBody());
    }

    /**
     * @Then I want to print request
     */
    public function iWantToPrintRequest()
    {
        dump($this->request);
    }
}

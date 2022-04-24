<?php

namespace App\Mail;

use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;

class noMatches extends Mailable
{
    use Queueable, SerializesModels;
    public $nomUser;
    /**
     * Create a new message instance.
     *
     * @return void
     */
    public function __construct($nomUser)
    {
        $this->nomUser=$nomUser;
    }

    /**
     * Build the message.
     *
     * @return $this
     */
    public function build()
    {
        return $this->view('emails.noMatches');
    }
}

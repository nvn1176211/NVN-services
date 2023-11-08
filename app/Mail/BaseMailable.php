<?php

namespace App\Mail;

use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;

class SuccessRegister extends Mailable
{
    public $from_name = '';
    public $from_address = '';
    public function __construct()
    {
        $this->from_name = config('mail.from.name');
        $this->from_address = $this->baseInfo->from_email_address;
    }
}
